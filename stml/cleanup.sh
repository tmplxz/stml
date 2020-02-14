#!/bin/sh
# cleans up all temporary files created by the app

rm .config
rm ./.*.npy
rm -r CV_*
rm -r imgs
rm -r texplots
rm -r stml/__pycache__
rm -r stml/.pytest_cache
rm -r tests/__pycache__
rm -r .pytest_cache
rm -r .cache
rm fig_*
rm report_*
rm pred_*
