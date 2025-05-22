#!/usr/bin/env python3
"""
Animated Device Tracker

Description:
Creates a GIF animation of a device's movement path using timestamped lat/lon data.

Input CSV Format (device_trail.csv):
- timestamp
- lat
- lon
"""

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.animation as animation

data = pd.read_csv("device_trail.csv")
fig, ax = plt.subplots()
ln, = plt.plot([], [], 'bo-', animated=True)

def init():
    ax.set_xlim(data['lon'].min() - 0.01, data['lon'].max() + 0.01)
    ax.set_ylim(data['lat'].min() - 0.01, data['lat'].max() + 0.01)
    return ln,

def update(frame):
    subset = data.iloc[:frame+1]
    ln.set_data(subset['lon'], subset['lat'])
    return ln,

ani = animation.FuncAnimation(fig, update, frames=len(data), init_func=init, blit=True)
ani.save("device_animation.gif", writer='pillow')
print("Generated: device_animation.gif")
