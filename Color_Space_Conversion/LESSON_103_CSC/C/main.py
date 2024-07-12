 
from PIL import Image
import io

# Path to the .data file
file_path = 'image_output_RGB_64_48_03.data'

# Try to open the file
try:
    with open(file_path, 'rb') as file:
        img_data = file.read()
        img = Image.new("RGB",io.BytesIO(img_data))
        img.save("Final.png")  # This will open the image using the default image viewer
except Exception as e:
    print(f"Error: {e}")
