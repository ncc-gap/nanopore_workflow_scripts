from __future__ import print_function
import os, sys
import subprocess
import gzip


def get_info_val(infos, key, delimiter):
    l_ret = []
    l_info = infos.split(';')
    for info in l_info:
        if info.startswith(key):
            ret = info.split("=")[1]
            l_ret = ret.split(delimiter)
            break
    return l_ret


def filter(infile, info_key, output, threas_af):

    info_cols = []
    pos_gnomadaf = -1

    hOUT = open(output, 'w')
    with gzip.open(infile, 'rb') as hin:
    #with open(infile, 'r') as hin:
        #for line in hin:
        for raw in hin:
            line = raw.decode()
            line = line.rstrip('\n')
            if line.startswith('#'):
                print(line, file=hOUT)
                if line.startswith('##INFO=<ID=%s,' % (info_key)):
                    info_cols = line.rstrip().rstrip(">").rstrip('"').split("|")
                    info_cols[0] = info_cols[0].split(" ")[-1]
                    pos_gnomadaf = info_cols.index("gnomADg_AF")
                continue
            
            F = line.split('\t')
            ref = F[3]
            alt = F[4]
            info = F[7]
            
            # if len(ref) > 1: continue
        
            f_continue = False 
            l_alt = alt.split(',')
            for v in l_alt:
                if v == ref: f_continue = True 
                if len(v) != len(ref) : f_continue = True 
                if len(ref) > 3: f_continue = True 
            if f_continue: continue
            
            f_print = False
            l_vep_annotations = get_info_val(info, info_key, ",")
            
            # if Vep Annotation is empty
            if l_vep_annotations == []: continue
            
            for vep_annotation in l_vep_annotations:
                l_vep_vals = vep_annotation.split('|')
                if len(l_vep_vals) <= pos_gnomadaf:
                    continue
                gnomadaf = l_vep_vals[pos_gnomadaf]
                if gnomadaf != "" and float(gnomadaf) > float(threas_af):
                    f_print = True
                    break
                    
            if f_print: print(line, file=hOUT)
    hOUT.close()


# main
if __name__ == "__main__":
    
    input = sys.argv[1]
    output = sys.argv[2]
    af = sys.argv[3]
    
    # out_pref, ext = os.path.splitext(args.output)
    filter(input, "CSQ", output, af)
    

    

['Allele', 'Consequence', 'IMPACT', 'SYMBOL', 'Gene', 'Feature_type', 'Feature', 'BIOTYPE', 'EXON', 'INTRON', 'HGVSc', 'HGVSp', 'cDNA_position', 'CDS_position', 'Protein_position', 'Amino_acids', 'Codons', 'Existing_variation', 'ALLELE_NUM', 'DISTANCE', 'STRAND', 'FLAGS', 'MINIMISED', 'SYMBOL_SOURCE', 'HGNC_ID', 'MANE_SELECT', 'MANE_PLUS_CLINICAL', 'REFSEQ_MATCH', 'SOURCE', 'REFSEQ_OFFSET', 'GIVEN_REF', 'USED_REF', 'BAM_EDIT', 'HGVS_OFFSET', 'HGVSg', 'CLIN_SIG', 'SOMATIC', 'PHENO', 'VAR_SYNONYMS', 'gnomADg', 'gnomADg_AF', 'gnomADg_AF_eas']