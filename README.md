# Bayesian Price Modelling

This repository contains the simulation code associated with the paper:

**Bayesian Asset Price Modelling with Asymmetric Mean Reversion**

The code implements synthetic data simulation and Bayesian parameter estimation for the Geometric Mean Reversion (GMR) model described in the paper. The simulation section is used to evaluate whether the Bayesian inference framework can recover the true model parameters under different parameter settings and prior choices.

## Repository structure

```text
bayesian_price_modelling/
│
├── notebooks/
│   └── simulation.ipynb
│
├── src/
│
├── stan/
│
├── requirements.txt
└── README.md
```

## Main notebook

The main notebook is:

```text
notebooks/simulation.ipynb
```

It includes code for:

* simulating synthetic asset price paths;
* computing the adaptive average;
* fitting the GMR model using Stan through CmdStanPy;
* comparing inferred posterior parameters with the true simulation parameters.

## Installation

Create a Python environment and install the required packages:

```bash
pip install -r requirements.txt
```

The code also requires CmdStan. After installing `cmdstanpy`, CmdStan can be installed from Python using:

```python
import cmdstanpy
cmdstanpy.install_cmdstan()
```

## Running the notebook

Start Jupyter Notebook from the repository folder:

```bash
jupyter notebook
```

Then open:

```text
notebooks/simulation.ipynb
```

## Notes

The notebook is provided as reproducible research code for the simulation component of the paper. Some settings may be reduced for demonstration purposes to make the notebook easier to run on a standard laptop. The full simulation settings used in the paper may require longer computation time.

## Citation

If you use this code, please cite the associated paper. A permanent archived version of this repository will be made available through Zenodo after release.
