# Spatio-temporal Gap Filling with Machine Learning - STML

## General Information

This repository contains spatio-temporal gap filling software.
Our probabilistic gap filling approach is currently under review for scientific publication, we here allow reviewers and readers to reproduce and better understand our results.

We deploy probabilistic machine learning (ML) methods on incomplete dataset to reconstruct missing values.
Keep in mind that this software serves as an exemplary implementation of theoretical methods and is intended for scientific usage.

## Software Requirements

The software is implemented and tested with Python 3.5.
It comes with a Dockerfile and thus can be run inside a Docker container.
For usage without containers, Python needs to be installed.
Next install this package by running `pip install .` in the root directoriy of the repository.
There are some mandatory package requirements (*numpy*, *scipy*, *scikit-learn*, *Pillow*, *scikit-image*), which will be installed on the fly.
To make use of the whole functionality, you might also want to consider installing the optional packages:

* pxpy (for probabilistic gap filling)
* networkx & matplotlib (for generating figures of MRF structures)
* Tkinter (for viewing results with the *gap_filling_viewer*)

In order to generate plots, a valid LaTeX distribution with `pgfplots` and `pdflatex` support needs to be installed as well.

## How To Use

For standalone gap filling, simply run `python -m stml`. Pass `-h` for a detailed overview of command line parameters.
Run the `stml/cleanup.sh` script for cleaning the current directory of files generated by stml (also available from `stml.helpers`).

`scripts/gap_filling_viewer.py` allows to interactively inspect gap filling results, it is simply started via command line.
It uses *Pillow* and *Tkinter*, and can be controlled via mouse and keyboard.
Pass `-h` for a detailed overview of command line parameters.

## Data for Gap Filling

The implemented gap filling methods have been tested on synthetic data as well as real-world remote sensing datasets.
Via `-d Chess`, experiments can be run with the synthetic data and gaps at `t=2`.
By passing `-d Chess2`, experiments use the synthetic data where `t=2` is completely missing.

The `Dortmund From Space 2018` data (aka `GER`) can be found at <https://www.dropbox.com/sh/ohbb4zpae9djb3z/AADi5qGbsPB2peLGg2-gh8LWa>.
For usage, download it directly, unzip the obtained archive, and pass `-d [download path]/dortmund_from_space_2018/` to the software. More information on this data can be found in the corresponding *README*.

## Outline of Gap Filling Method

1. Load and reshape spatio-temporal data and gap masks

2. Set up a cross-validation (CV) and add artificial gaps in each split

3. For each CV split:

    a. Learn the model on the training data

    b. Predict the missing entries in the test data

    c. Evaluate results on artificial gaps

4. Merge reports and visualize results

## Attached Results

Images and error reports on `FRA` data can be found at <https://www.dropbox.com/sh/rj959rhjr9ndec0/AAAOA8vSzv0pANMFZXstjxwWa>, and results on `GER` data can be downloaded from <https://www.dropbox.com/sh/dojhb0dhzljznyy/AAC-PVlGidGFkx-RFvQw5oG3a>.
This software allows to reproduce all these results, the command line arguments can be dervied from filenames. Resulting images can also be inspected with the `gap_filling_viewer`, by passing the downloaded directories as arguments. As an example, viewing downloaded *CROSS* predictions on `FRA` can be done by running:

`python scripts/gap_filling_viewer.py`
`-l [path]/imgs/original_outline/`
`-m [path]/imgs/mask/`
`-r [path]/imgs/pred_outline_mrf_s0_01_tp_es_0_01_cross3_sup_em5_k32means_spatial_clouds0_2/`
`-R [path]/report_mrf_s0_01_tp_es_0_01_cross3_sup_em5_k32means_spatial_clouds0_2.csv`
`-y 2016`

## Reference

If you use this code or the data, please link back to <https://github.com/tmplxz/stml>.

## Term of Use

Please refer to `LICENSE.md` for terms of use.

Copyright (c) 2020 <https://github.com/tmplxz>
