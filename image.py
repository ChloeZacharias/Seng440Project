from PIL import Image


def read_data_file(file_path):
    with open(file_path, 'rb') as file:
        data = file.read()
    return data


def convert_image():
    # Function to read the .data file

    # Load the image data from the .data file
    file_path = 'image_output_RGB_64_48.data'
    raw_data = read_data_file(file_path)

    # Convert the raw data to a list of tuples representing RGB values
    # Assuming the .data file contains 64x48 RGB image data
    image_data = [(raw_data[i], raw_data[i + 1], raw_data[i + 2]) for i in range(0, len(raw_data), 3)]

    # Create a new image with the given dimensions
    image = Image.new('RGB', (64, 48))

    # Put the pixel data into the image
    image.putdata(image_data)

    # Save the image as a PNG file
    image.save('output_image.png')

    print("Image saved as output_image.png")


if __name__ == '__main__':
    convert_image()
