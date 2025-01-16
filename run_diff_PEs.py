import os
import subprocess

# Directory containing the generated JSON files
arch_dir = "./examples/arch"

# Names of the 10 specific JSON files that were generated
json_files = [f"3_level_mem_basic_{i}_PEs.json" for i in range(10, 20)]

# Other file paths
layer_file = "./examples/layer/resnet_18_conv2x_batch16.json"
schedule_file = "./examples/schedule/dataflow_C_K.json"
output_file = "testing_diff_PEs.txt"

# Run the command for each specific JSON file
for json_file in json_files:
    # Construct the full path to the JSON file
    json_file_path = os.path.join(arch_dir, json_file)
    
    # Ensure the file exists before running
    if os.path.exists(json_file_path):
        # Construct the command
        command = [
            "python3", 
            "./tools/run_optimizer.py", 
            "basic", 
            json_file_path, 
            layer_file, 
            "-s", 
            schedule_file, 
            "-v"
        ]
        
        # Open the output file in append mode
        with open(output_file, "a") as output:
            # Execute the command and redirect output
            subprocess.run(command, stdout=output, stderr=subprocess.STDOUT)
            print(f"Executed command for: {json_file}")
    else:
        print(f"File not found: {json_file_path}")
