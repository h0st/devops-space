# Conda 

## URLS:

1. https://docs.conda.io/projects/conda/en/latest/index.html
2. https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/packages.html 
3. 
4. 
5. 

## Commands

conda search scipy

conda install scipy

You may build a package after installing conda-build
conda build my_fun_package




## Package structure
.
├── bin
│   └── pyflakes
├── info
│   ├── LICENSE.txt
│   ├── files
│   ├── index.json
│   ├── paths.json
│   └── recipe
└── lib
    └── python3.5

* bin contains relevant binaries for the package.
* lib contains the relevant library files (eg. the .py files).
* info contains package metadata.