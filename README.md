# CPC2
Dockerising CPC2 for simplified use!

You can use the CPC tool online at [the CPC2 site](http://cpc2.cbi.pku.edu.cn/), where I think it running the python code in cgi/bin or something. CPC2 makes use of a few simple parameters (fickett score, ORF length, ORF integrity and protein isoelectric point) to give a coding probability for a given transcript, and a condon/noncoding label.

The underlying model is a support vector machine, and I think CPC2 implements an interface to libsvm.

This repo seeks to containerise the tool so I can run it anywhere, particularly using singularity on HPC. 

# Use
To get the container, you can 

```
docker pull afgreen/cpc2:latest
```

or 
```
singularity pull cpc2.sif oras://ghcr.io/afg1/cpc2:latest
```

Running with docker, I think you need to mount the current directory into the working directory of the image, so you should do something like this:
```
docker run --rm afgreen/cpc2:latest -v `pwd`:/workdir -i <path to your fasta>
```
which will spit out a result file in your current directory. 

Running with singularity should be as simple as 
```
singularity run cpc2.sif -i <path to your fasta>
```

The output is a TSV file with the fasta ID and some features, see the [CPC2 paper](https://academic.oup.com/nar/article/45/W1/W12/3831091) to figure out what it all means

