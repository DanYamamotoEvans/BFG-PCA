# Barcode Fusion Genetics related codes

This page explains how to install and execute the BFG-PCA codes.
Please go to the [BFG-PCA wiki](https://github.com/DanYamamotoEvans/BFG-PCA/wiki) for more information regarding the experimental setup and analysis.

Dependicies:
```sh
Python version >=3.5
pip    version >= 1.1.0
numpy  version >=1.19 
tqdm   version >=2.2.4
```
To install these pakcages, first clone thios repository by
```sh
git clone https://github.com/DanYamamotoEvans/BFG-PCA.git
```

Next, go to the location of the BFG-PCA folder in the terminal, and install the dependecies by
```sh
pip install .
```

Other core programs to install:
- [Jupyter-notebook](https://jupyter.org/install)
```sh
pip install jupyterlab
```
- Commandline BLAST+
Follow the [instruction manual](https://www.ncbi.nlm.nih.gov/books/NBK569861/) for installation.
Set the PATH of the binary file.

Execute the following to see if installation is complete.
```sh
blastn -help
```
    
## Overview
This script was built to perform experimental plans and data analysis for Barcode Fusion Genetics screenings. There are four main steps in this suit, which I have prepared jupyter-notebooks for each.

- Monte-Carlo simulation
- Barcode calling
- Normalization
- Performance measure
- (Visualization)

### Monte-carlo simulation of BFG screening proccess
Since BFG screenings have multiple sampling steps while handling a complex pool of strains, we suimulate the sampling process with a Monte-Carlo simulation. This notebook follows the procedures of BFG screenings, and allows the user to estimate the nessesary paramaters for sampling. 


### Barcode calling

### Normalization

### Performance measure

### Visualization


### Refs
- [Yachie _et al_, 2016](https://www.embopress.org/doi/full/10.15252/msb.20156660)
- [Evans-Yamamamto _et al_, 2021 (Preprint)](https://www.biorxiv.org/content/10.1101/2021.07.27.453987v1)



