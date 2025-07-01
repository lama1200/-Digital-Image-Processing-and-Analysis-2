```markdown
# License Plate Character Segmentation - Assignment 

## Project Overview
This repository contains the solution for Digital Image Processing and Analysis* course (CSC478, 2nd Semester 1446). The goal is to read, preprocess, and segment a license plate image into its characters using MATLAB.

## Objective
- Load and convert the license plate image to grayscale.
- Enhance edges with a Laplacian high-pass filter.
- Binarize and clean noise using thresholding and morphological operations.
- Count segmented characters via connected component analysis.


````


## Script Details (`task1.m`)

1. **Image Loading & Grayscale**: Reads image and converts to grayscale to improve contrast and reveal plate details clearly.
2. **High-Pass Filtering**: Applies a Laplacian filter to the grayscale image, enhancing edges so that character boundaries on the plate become more pronounced and easier to detect.
3. **Binarization & Noise Removal**: Converts the enhanced image to a binary format, separating foreground characters from the background. Morphological closing and opening then remove small artifacts and smooth character shapes.
4. **Character Segmentation & Counting**: Uses connected component analysis to isolate each character region. The script extracts and displays each character, and prints the total count, demonstrating clear segmentation.

## Results

* **Grayscale Conversion**: The original plate image is transformed into a clear grayscale version, highlighting contrast between characters and background.
* **Edge Enhancement**: The high-pass filtered image (`im2`) shows sharp character edges, making the plate's inscriptions stand out prominently.
* **Binary Cleaning**: The binary image before and after morphological operations illustrates removal of noise and preservation of true character shapes.
* **Character Segments**: Individual character images are displayed in the `results/` folder, with the MATLAB console reporting the exact number of detected characters.
* Grayscale image
* Enhanced edge image
* Binary image before and after noise removal
* Individual character segments and total count printed in the MATLAB console

## Author

**Lama Alotibie**

```
```
