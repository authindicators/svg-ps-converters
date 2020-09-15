# SVG P/S Converter - Windows 10 GUI

A simple standalone application for Windows 10 that offers a GUI interface to convert an SVG Tiny 1.2 file into SVG P/S format.

## Instructions

1. Download the [compiled executable application](https://github.com/authindicators/svg-ps-converters/blob/master/gui-win10/svgConverter_v0.1-exe.zip), or download the source code and compile it.
1. Run the application.
1. Select the input file.
1. Add or modify the title of the image (this is the title to be embedded within the SVG P/S file, not to be confused with the filename).
1. Click the "Convert" button.

The converted file will be saved to the same location directory as the input source file, with the output filename matches the input file name, postpended with "\_tiny_ps.svg".

## Notes

- Running the downloaded application may trigger security warnings. You may decide to download the source code, inspect it, and compile the application yourself before proceeding.
- The tool was primarily designed for use with SVG Tiny 1.2 files exported from Adobe Illustrator, though SVGs exported from other applications (e.g. Inkscape) may work.  But your mileage may vary.
- SVG Tiny 1.2 allows for embedded raster images within the <image> element, but they are not allowed in SVG P/S.  And since embedded images are difficult to convert into vectors, their existence will result in a conversion failure.
