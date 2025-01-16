import re
import sys

# Check for the correct number of command-line arguments
if len(sys.argv) != 3:
    print("Usage: python script.py <input_file_path> <output_file_path>")
    sys.exit(1)

# Get input and output file paths from command-line arguments
input_file_path = sys.argv[1]
output_file_path = sys.argv[2]

# Open the input file and read its content
with open(input_file_path, "r") as file:
    lines = file.readlines()

# Pattern to match the line starting with {'mem_levels': 3
pattern_mem_levels = re.compile(r"\{'mem_levels': 3.*'capacity': (\[.*?\])")
pattern_optimal_energy = re.compile(r"Optimal_Energy_\(pJ\):\s+([\d.]+)")

# List to store the extracted results
extracted_groups = []

# Iterate through the lines
for i, line in enumerate(lines):
    match_mem_levels = pattern_mem_levels.search(line)
    if match_mem_levels:
        # Extract the capacity array
        capacity = match_mem_levels.group(1)
        # Get the following line if it exists and matches Optimal_Energy_(pJ)
        if i + 1 < len(lines):
            match_optimal_energy = pattern_optimal_energy.search(lines[i + 1])
            if match_optimal_energy:
                optimal_energy_value = float(match_optimal_energy.group(1))
                optimal_energy_line = lines[i + 1].strip()
                # Append the group as a tuple (energy, capacity, energy line)
                extracted_groups.append((optimal_energy_value, f"Capacity: {capacity}", optimal_energy_line))

# Sort the groups by the Optimal_Energy_(pJ) value (the first element in the tuple)
extracted_groups.sort(key=lambda x: x[0])

# Prepare the sorted lines with separators
sorted_lines = []
for _, capacity_line, optimal_energy_line in extracted_groups:
    sorted_lines.append(capacity_line)
    sorted_lines.append(optimal_energy_line)
    sorted_lines.append("")  # Add an empty line for separation

# Write the sorted lines to the output file
with open(output_file_path, "w") as file:
    file.write("\n".join(sorted_lines))

print(f"Extracted and sorted lines have been written to {output_file_path}")
