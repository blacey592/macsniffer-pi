#!/usr/bin/env python3
"""
Surveillance Heatmap Generator

Description:
Generates a KDE heatmap image of high-activity locations using latitude and longitude data.

Input CSV Format (heatmap_logs.csv):
- lat
- lon
"""

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

data = pd.read_csv("heatmap_logs.csv")

plt.figure(figsize=(8, 6))
sns.kdeplot(data=data, x='lon', y='lat', cmap="Reds", fill=True, bw_adjust=0.5)
plt.title("Surveillance Heatmap")
plt.xlabel("Longitude")
plt.ylabel("Latitude")
plt.savefig("surveillance_heatmap.png")
print("Generated: surveillance_heatmap.png")
