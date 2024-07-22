import subprocess
import sys
import time
import os
from datetime import datetime
import re


def main(output=True, compiler="gcc", run_prefix=""):
    # Define the C source file and the output executable file
    main_file = "CSC_main.c"
    extra_files = ["CSC_RGB_to_YCC_01.c", "CSC_YCC_to_RGB_01.c"]

    output_file = "CSC_main"

    command_compile = f"{compiler} -O3 -o {output_file} {main_file} {' '.join(extra_files)} -mfpu=neon"

    # Compile the C program
    print(f"Compiling Program...\n{command_compile}")
    os.system(command_compile)

    # Check if the compilation was successful
    if os.path.isfile(output_file):
        print(f"Compilation successful, executable '{output_file}' created.")
    else:
        print("Compilation failed.")
        exit(1)

    command_run = f"{run_prefix} ./{output_file}"
    start_time = time.time()

    os.system(command_run)

    result_time = time.time() - start_time

    print(f"--- Program ran in {result_time} seconds ---")

    print("=" * 20)

    current_datetime = datetime.now().strftime("%Y-%m-%d %H-%M-%S")

    command_cachegrind = f"{run_prefix} valgrind --tool=cachegrind --cachegrind-out-file=cachegrind.out {command_run}"

    result_cachegrind = subprocess.run(command_cachegrind, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                       text=True)

    if result_cachegrind.returncode != 0:

        print(f"Running the program resulted in an error: \n{result_cachegrind.stdout}")
        exit(1)

    command_cachegrind_annotate = f"cg_annotate cachegrind.out"

    result_cachegrind_annotate = subprocess.run(command_cachegrind_annotate, shell=True, stdout=subprocess.PIPE,
                                                stderr=subprocess.PIPE,
                                                text=True)

    output = f"""Log({current_datetime}):\nRuntime: {result_time}\n{result_cachegrind_annotate.stdout}\nCachegrind Result: \n{result_cachegrind.stdout}"""

    if output:
        with open(f"./Logs/LOG-{current_datetime}.log", "w") as f:
            f.write(output)
        print(f"Finished, log written: Logs/LOG-{current_datetime}.log")


if __name__ == '__main__':
    try:
        if len(sys.argv) != 1:
            print(f"Calling with {sys.argv[1] == 'out'},{sys.argv[2]},{sys.argv[3]}")
            main(sys.argv[1] == "out", sys.argv[2], sys.argv[3])
        else:
            main()
    except Exception as e:
        print("Cannot run test.py with current setup\n---", e)
