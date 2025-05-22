#!/usr/bin/env python3
"""
MAC Map Trail Generator

Description:
This script plots MAC address sightings on an interactive HTML map using latitude and longitude coordinates.

Input CSV Format (mac_logs.csv):
- mac
- timestamp
- lat
- lon
"""

import pandas as pd
import folium

data = pd.read_csv("mac_logs.csv")
m = folium.Map(location=[data['lat'].mean(), data['lon'].mean()], zoom_start=14)

for _, row in data.iterrows():
    folium.CircleMarker(
        location=[row['lat'], row['lon']],
        radius=5,
        popup=f"MAC: {row['mac']}\nTime: {row['timestamp']}",
        color='blue',
        fill=True
    ).add_to(m)

m.save("mac_map_trail.html")
print("Generated: mac_map_trail.html")
