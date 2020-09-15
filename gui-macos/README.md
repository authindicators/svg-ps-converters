# SVG P/S Converter - MacOS GUI

A simple standalone application for MacOS that offers a GUI interface to convert an SVG Tiny 1.2 file into SVG P/S format.

## Instructions

1. Download the [compiled executable application](https://github.com/authindicators/svg-ps-converters/blob/master/gui-macos/SvgConverter_v0-1_app.zip), or download the source code and compile it.
1. Run the application.
1. Select the input file.
1. Add or modify the title of the image (this is the title to be embedded within the SVG P/S file, not to be confused with the filename).
1. Click the "Convert" button.

The converted file will be saved to the same location directory as the input source file, with the output filename matches the input file name, postpended with "\_tiny_ps.svg".

## Notes

- Running the downloaded application may trigger security warnings. If you feel comfortable doing so, you can open the application using the context menu (rather than double-clicking on the application), and this should allow you to run the application despite some warnings. You may also decide to download the source code, inspect it, and compiling the application yourself before proceeding.
- The tool was primarily designed for use with SVG Tiny 1.2 files exported from Adobe Illustrator, though SVGs exported from other applications (e.g. Inkscape) may work.  But your mileage may vary.
- SVG Tiny 1.2 allows for embedded raster images within the <image> element, but they are not allowed in SVG P/S.  And since embedded images are difficult to convert into vectors, their existence will result in a conversion failure.
- If the input SVG file contains an embedded <image> element, that element will be exported as a ".png" file to the output folder.
