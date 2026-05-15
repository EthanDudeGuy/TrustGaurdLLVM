import subprocess
import csv
import sys

def benchmark_command(command, num_runs, output_file):
    # The format string for /usr/bin/time:
    # %e = Real (wall) time
    # %S = System (kernel) time
    # %U = User time
    time_format = "%e,%S,%U"
    
    results = []
    
    print(f"Benchmarking: {' '.join(command)}")
    print(f"Runs: {num_runs}")

    for i in range(1, num_runs + 1):
        # We wrap the command with /usr/bin/time
        # stderr is used because 'time' outputs its stats to stderr by default
        cmd = ["/usr/bin/time", "-f", time_format] + command
        
        process = subprocess.Popen(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE, 
            text=True
        )
        stdout, stderr = process.communicate()
        
        # The last line of stderr contains our formatted time data
        time_data = stderr.strip().split('\n')[-1]
        
        try:
            real, sys_time, user = time_data.split(',')
            results.append({
                "run": i,
                "real": real,
                "sys": sys_time,
                "user": user
            })
            print(f"Run {i} complete.")
        except ValueError:
            print(f"Error parsing run {i}. Raw stderr: {stderr}")

    # Write to CSV
    keys = ["run", "real", "sys", "user"]
    with open(output_file, 'w', newline='') as f:
        dict_writer = csv.DictWriter(f, fieldnames=keys)
        dict_writer.writeheader()
        dict_writer.writerows(results)

    print(f"\nSuccess! Results saved to {output_file}")

if __name__ == "__main__":
    # Example usage: 
    # python script.py <num_runs> <output_csv> <command_to_run>
    if len(sys.argv) < 4:
        print("Usage: python script.py <runs> <output.csv> <cmd...>")
    else:
        iterations = int(sys.argv[1])
        out_csv = sys.argv[2]
        target_cmd = sys.argv[3:]
        benchmark_command(target_cmd, iterations, out_csv)
