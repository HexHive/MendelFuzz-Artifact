# MendelFuzz: The Return of the Deterministic Stage

This repository contains the artifact for our paper: 
**MendelFuzz: The Return of the Deterministic Stage**, which will 
appear in FSE'25.

The MendelFuzz is an improved deterministic stage built on AFL++.
From [4.10c](https://github.com/AFLplusplus/AFLplusplus/releases/tag/v4.10c
), the MendelFuzz's deterministic stage became the default mode 
in AFL++. So the source code of MendelFuzz can be found on [AFL++'s 
repo](https://github.com/AFLplusplus/AFLplusplus/blob/stable/src/afl-fuzz-skipdet.c) and you can play with AFL++ directly.


## Citation

```bib
@inproceedings{zheng2025mendel,
  author       = {Zheng, Han and Toffalini, Flavio and B{\"o}hme, Marcel and Payer, Mathias},
  title        = {MendelFuzz: The Return of the Deterministic Stage},
  booktitle    = {Proceedings of the ACM International Conference on the Foundations of Software Engineering},
  year         = {2025},
  numpages     = {21},
}
```

## Reproduce the results

Our paper primary use two benchmark: MAGMA and FuzzBench.

### Reproduce FuzzBench

Regarding FuzzBench, we request evaluation from Google directly, and 
the FuzzBench results in the paper is collected from the public report 
https://fuzzbench.com/reports/experimental/2024-01-26-aflpp-sk/index.html,
in which the `aflplusplus_sk` represent the MendelFuzz.
We also provide the data in `fuzzbench` directory (remove the libAFL as it's 
not related).

As this evaluation is running on the Google cluster and comparing against the 
best configuration, we don't provide a local reproduce. You can use the 
AFL++'s FuzzBench configuration for MendelFuzz to replicate the results.

### Reproduce the MAGMA

Simply step to `magma/tools/captain` and run `./run.sh`

The `aflplusplus_skipdet` is our prototype MendelFuzz (AFL++ 4.10c), 
`aflplusplus_det/nodet` are old AFL++ configured with 
and without deterministic stage (both in 4.10c, but before MendelFuzz 
intergration). 

Regarding bug claim, MAGMA already provide unique bug metric (which is also their core contribution),
just run the script 'tools/benchd/exp2json.py $PATH_TO_WORKDIR bugs.json' and parse. 

In terms of coverage claim, we replay all generated seeds on AFL++ instrumented binary 
and use afl-showmap to collect each fuzzer-trail's edge coverage. 


The automation script we use requires patching the ENTRYPOINT, so far we're still working on 
a solution that does not requires the change of MAGMA itself. 
If you're just comparing the two best configurations `mendelfuzz` and `aflplusplus_nodet`, 
comparing the `tail -n 1 /path/to/plot_data` can work equivalently, as both fuzzers are using the 
same AFL++ (collision-free edge) coverage.



