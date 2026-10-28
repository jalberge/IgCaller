### Demo dataset to test IgCaller

Tumor and normal BAM files of the IG loci of a CLL patient might be found in the "BAM" folder. 
The expected output is placed in the "Outputs" folder. 

In order to generate this demo, IgCaller was run using the following command line:

```
/path/to/IgCaller/IgCaller \
    -I /path/to/IgCaller/IgCaller_reference_files/ -V hg19 -C ensembl \
    -T /path/to/IgCaller/Demo/BAM/1344-01-03TD.bam -N /path/to/IgCaller/Demo/BAM/1344-01-01ND.bam \
    -seq wgs -seqDepth low -pm paired
```
