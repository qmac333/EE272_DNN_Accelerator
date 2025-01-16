import json
import os

# Base JSON structure
base_data = {
    "mem_levels": 3,
    "capacity": [64, 131072, 1073741824],
    "access_cost": [0.12, 20.2, 200],
    "parallel_count": [324, 1, 1],
    "parallel_cost": [0.035],
    "capacity_scale": [2, 2],
    "access_cost_scale": [2, 1.5],
    "explore_points": [1, 1],
    "precision": 16
}

# Range of values for the first element of 'parallel_count'
values = [i**2 for i in range(10, 20)]

# Directory to save files
output_dir = "./examples/arch"
os.makedirs(output_dir, exist_ok=True)  # Create the directory if it doesn't exist

# Generate files
for value in values:
    # Update the 'parallel_count' value
    base_data["parallel_count"][0] = value
    
    # Create the filename
    filename = f"3_level_mem_basic_{int(value**0.5)}_PEs.json"
    filepath = os.path.join(output_dir, filename)  # Full path
    
    # Write to the file
    with open(filepath, "w") as file:
        json.dump(base_data, file, indent=4)
        print(f"Generated file: {filepath}")
