import os
import time


def get_mod_times(directory):
    """Get modification times of files in the directory."""
    mod_times = {}
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)
        if os.path.isfile(filepath):
            mod_times[filename] = os.path.getmtime(filepath)
    return mod_times


def check_for_updates(directory, prev_mod_times):
    """Check if any files in the directory have been updated."""
    current_mod_times = get_mod_times(directory)
    for filename, mod_time in current_mod_times.items():
        if (filename not in prev_mod_times or mod_time > prev_mod_times[filename]) and filename not in ["CSC_main", "image_output_RGB_64_48.data", "output_image.png"]:
            print(f"filename updated: {filename}")
            return True, current_mod_times
    return False, prev_mod_times


prev_root_status = get_mod_times("./")
prev_new_status = get_mod_times("./NEW_CODE/")

while True:
    # Check for updates in both directories
    root_status, prev_root_status = check_for_updates("./", prev_root_status)
    new_status, prev_new_status = check_for_updates("./NEW_CODE/", prev_new_status)

    if root_status or new_status:
        os.system("clear")
        compiler = "gcc"
        main_file = "CSC_main.c"
        extra_files = ["CSC_RGB_to_YCC_01.c",
                       "CSC_YCC_to_RGB_01.c",
                       "./NEW_CODE/rgb_to_ycc.c",
                       "./NEW_CODE/ycc_to_rgb.c",
                       "./NEW_CODE/upscale.c"]

        output_file = "CSC_main"

        command_compile = f"{compiler} -O3 -o {output_file} {main_file} {' '.join(extra_files)} -mfpu=neon"

        # Compile the C program
        print(f"Compiling Program...\n")
        os.system(command_compile)

        # Check if the compilation was successful
        if os.path.isfile(output_file):
            print(f"Compilation successful, executable '{output_file}' created.")
        else:
            print("Compilation failed.")
            exit(1)

        # Optionally run the compiled program
        command_run = f"./{output_file}"
        os.system(command_run)
        print("PROGRAM RAN SUCCESSFULLY")

    # Sleep for a certain period before checking again
    time.sleep(0.1)  # Sleep for 10 seconds
