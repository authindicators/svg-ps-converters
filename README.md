# Tools to Export Images into SVG Tiny Portable/Secure Format

## Summary

The goal of this project is to develop various open source tools that will convert or export a vector image into a more constrained and secure SVG format. The new format is based [SVG Tiny 1.2](https://www.w3.org/TR/SVGTiny12/) as defined by the W3C, though it is more restrictive and requires additional modification.  As there are currently no tools available for the new format, the code of this project helps to fill that gap.

The new [SVG Tiny Portable/Secure (SVG P/S)](https://tools.ietf.org/id/draft-svg-tiny-ps-abrotman-00.txt) format is specified by a new document published to the IETF for comments.  In addition to the specification document, a [SVG P/S RELAX NG Compact (RNC) XML](https://bimigroup.org/resources/SVG_PS-latest.rnc.txt) schema validation file has also been developed that can be used to verify the output is compliant with the new SVG P/S format.

**NOTE:** *As the SVG P/S specification is currently only a draft, it is likely to change based on feedback and discussions that will require changes to this work as necessary.*

## Initial Prototypes

The initial v.01 prototype source code was developed by [Mouaad Boukiaou](https://www.upwork.com/freelancers/~014dce51f695c1c664), and has all been released under an [MIT licence](https://opensource.org/licenses/MIT).

- [Standalone GUI Tool - Windows 10](https://github.com/authindicators/svg-ps-converters/tree/master/gui-win10)
- [Standalone GUI Tool - MacOS](https://github.com/authindicators/svg-ps-converters/tree/master/gui-macos)
- [Adobe Illustrator Export Script](https://github.com/authindicators/svg-ps-converters/tree/master/illustrator-script)
