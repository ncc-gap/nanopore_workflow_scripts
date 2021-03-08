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

    hOUT = open(output, 'w')
    with gzip.open(infile, 'rb') as hin:
    #with open(infile, 'r') as hin:
        for line in hin:
            line = line.rstrip('\n')
            if line.startswith('#'):
                print(line, file=hOUT)
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
                #simpleRepeat = l_vep_vals[1]
                simpleRepeat = ""
                if simpleRepeat == "":
                    gnomadaf = l_vep_vals[-2]
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
    

    
