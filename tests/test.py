import subprocess
import time
import json
import sys


def run_and_time_binary(binary_path, input_values):
    passed_tests = 0

    for test_case in input_values:
        input_args = test_case["input"].split()
        expected_output = test_case["output"]

        # Start timing
        start_time = time.time()

        try:
            # Run the binary and capture the output
            result = subprocess.run([binary_path] + input_args, capture_output=True, text=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error running the binary: {e}")
            return False

        # Stop timing
        end_time = time.time()
        elapsed_time = end_time - start_time

        # Get the output from the binary
        output = result.stdout.strip()

        # Verify the output
        if output == expected_output:
            print(f"Test case passed - Input: {input_args}, Output: {output}")
            passed_tests += 1
        else:
            print(f"Test case failed - Input: {input_args}, Output: {output}, Expected: {expected_output}")

        print(f"Execution time: {elapsed_time:.6f} seconds\n")

    print(f"Total test cases passed: {passed_tests}/{len(input_values)}")
    return passed_tests == len(input_values)


if __name__ == "__main__":
    binary_path = sys.argv[1]

    # Read test values from JSON file
    with open("./tests/testCases.json") as json_file:
        test_cases = json.load(json_file)

    if run_and_time_binary(binary_path, test_cases):
        print("All test cases passed.")
    else:
        print("Some test cases failed.")
        exit(1)
