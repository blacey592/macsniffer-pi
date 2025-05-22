#!/usr/bin/env python3
"""
Tower Coverage Mapper

Description:
This script generates a static PNG map showing the circular coverage area of towers using lat/lon and radius.

Input CSV Format (towers.csv):
- tower_id
- lat
- lon
- radius (in meters)
"""

import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv("towers.csv")
fig, ax = plt.subplots()
ax.set_title("Tower Coverage Map")

for _, row in data.iterrows():
    circle = plt.Circle((row['lon'], row['lat']), row['radius']/111000, color='red', alpha=0.3)
    ax.add_patch(circle)
    ax.text(row['lon'], row['lat'], row['tower_id'], fontsize=9)

ax.set_xlim(data['lon'].min() - 0.01, data['lon'].max() + 0.01)
ax.set_ylim(data['lat'].min() - 0.01, data['lat'].max() + 0.01)
ax.set_aspect('equal')
plt.xlabel("Longitude")
plt.ylabel("Latitude")
plt.savefig("tower_coverage_map.png")
print("Generated: tower_coverage_map.png")
