import os, sys, glob
import pandas as pd

# get all arguments except script name, which should be a list
filenames = glob.glob("4-results/*/*/*.csv")

# make combined csv

results_csv = pd.concat([pd.read_csv(f) for f in filenames])

# save csv

csv_path = "4-results/pyro-results.csv"
os.makedirs(os.path.dirname(csv_path), exist_ok=True)
results_csv.to_csv(csv_path, index=False)
