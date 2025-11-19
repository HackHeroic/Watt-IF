#!/bin/bash

# Create a new Conda environment named 'watt-if' with Python 3.10
conda create -n watt-if python=3.10 -y

# Install the required packages using conda-forge channel
conda install -n watt-if -c conda-forge pandas matplotlib seaborn missingno plotly scikit-learn -y

echo "Environment 'watt-if' created and all packages installed successfully!"
echo "To activate: conda activate watt-if"
