# Adobe Illustrator Export Script

A simple script that can be added to Adobe Illustrator (either Windows or MacOS) that offers the ability to convert an open SVG Tiny 1.2 file into SVG P/S format.

## Instructions

1. Download the the script.
1. Install the script into the "scripts" directory for Adobe Illustrator.
1. Run the Adobe Illustrator.
1. Open an SVG Tiny 1.2 file (which may have been previously exported by Adobe Illustrator using the "Save As SVG Tiny" option).
1. Select the "Scripts --> SaveAsSVGPS" script from the "File" menu of Adobe Illustrator.

The converted file will be saved with the output filename matching the input file name, postpended with "\_tiny_ps.svg".

## Notes

- The script was primarily designed for use with SVG Tiny 1.2 files exported from Adobe Illustrator, though SVGs exported from other applications (e.g. Inkscape) and opened back up from within Adobe Illustrator may work.  But your mileage may vary.
- SVG Tiny 1.2 allows for embedded raster images within the <image> element, but they are not allowed in SVG P/S.  And since embedded images are difficult to convert into vectors, their existence will result in a conversion failure.

