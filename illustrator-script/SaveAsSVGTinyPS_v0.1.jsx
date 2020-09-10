
/********************************************************************************************************************
  *
  * MIT Open Source License
  *
  * Copyright 2020 @Mouaad Boukiaou
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
  * documentation files (the "Software"), to deal in the Software without restriction, including without limitation
  * the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
  * and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  * The above copyright notice and this permission notice shall be included in all copies or substantial portions of
  * the Software.
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
  * THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
  * SOFTWARE.
  *
********************************************************************************************************************/

/********************************************************************************************************************
  *
  * SaveAsSVGTinyPS Script Version 0.1
  * The active document is saved as an SVG Tiny Portable/Secure file in a user specified folder.
  *
********************************************************************************************************************/
			
var ALLOWED_ELEMENTS_NAME = [
	"circle", "defs", "desc", "ellipse", "g", "line", "linearGradient", "path", "polygon", "polyline", "radialGradient", "rect", "solidColor", "svg", "text", "textArea", "title", "use"
];

var SVG_ALLOWED_ATTRIBUTES = [
	"about", "baseProfile", "class", "color", "color-rendering", "content", "contentScriptType", "datatype", "direction", "display-align", "externalResourcesRequired", "fill", "fill-opacity", "fill-rule", "focusable", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "line-increment", "playbackOrder", "preserveAspectRatio", "property", "rel", "resource", "rev", "role", "snapshotTime", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "timelineBegin", "typeof", "unicode-bidi", "vector-effect", "version", "viewBox", "width", "xml:base", "xml:lang", "xml:space", "zoomAndPan"
];

var DESC_ALLOWED_ATTRIBUTES = [
	"about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var TITLE_ALLOWED_ATTRIBUTES = [
	"about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var PATH_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "d", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "pathLength", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var RECT_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
];

var CIRCLE_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "r", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var LINE_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
];

var ELLIPSE_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var POLYLINE_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var POLYGON_ALLOWED_ATTRIBUTES = [
	 "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var SOLIDCOLOR_ALLOWED_ATTRIBUTES = [
	 "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var TEXTAREA_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
];

var LINEARGRADIENT_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
];

var RADIALGRADIENT_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "r", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var TEXT_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "editable", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rotate", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
];

var G_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var DEFS_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
];

var USE_ALLOWED_ATTRIBUTES = [
	"about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "href", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
];

var ALLOWED_ATTRIBUTES = {
	"circle": CIRCLE_ALLOWED_ATTRIBUTES,
	"defs": DEFS_ALLOWED_ATTRIBUTES,
	"desc": DESC_ALLOWED_ATTRIBUTES,
	"ellipse": ELLIPSE_ALLOWED_ATTRIBUTES,
	"g": G_ALLOWED_ATTRIBUTES,
	"line": LINE_ALLOWED_ATTRIBUTES,
	"linearGradient": LINEARGRADIENT_ALLOWED_ATTRIBUTES,
	"path": PATH_ALLOWED_ATTRIBUTES,
	"polygon": POLYGON_ALLOWED_ATTRIBUTES,
	"polyline": POLYLINE_ALLOWED_ATTRIBUTES,
	"radialGradient": RADIALGRADIENT_ALLOWED_ATTRIBUTES,
	"rect": RECT_ALLOWED_ATTRIBUTES,
	"solidColor": SOLIDCOLOR_ALLOWED_ATTRIBUTES,
	"svg": SVG_ALLOWED_ATTRIBUTES,
	"text": TEXT_ALLOWED_ATTRIBUTES,
	"textArea": TEXTAREA_ALLOWED_ATTRIBUTES,
	"title": TITLE_ALLOWED_ATTRIBUTES,
	"use": USE_ALLOWED_ATTRIBUTES,
}

try {
	if (app.documents.length > 0 ) {

		var destFolder = null;
		destFolder = Folder.selectDialog( 'Select folder for saving as SVG Tiny P/S.', '~' );

		if (destFolder != null) {
			// Get the option of SVG.
			var options = new ExportOptionsSVG();
	    	
	    	// Get the active document.
			var activeDoc = app.activeDocument;

			// Only the filename is extracted if the document name includes an extension.
			var filename = activeDoc.name.split('.').slice(0, -1).join('.');

			// Create new file for saving.
			var destFile = this.makeFile(filename+"_tiny_ps", 'svg', destFolder);
			
			// Save as SVG Tiny 1.1 or 1.2.
			activeDoc.exportFile(destFile, ExportType.SVG, options);

			// Reopen the file and get the string text.
			destFile.open("r");
			var xmlText = destFile.read();
			destFile.close();

			// Extract the source as xml.
			var xmlSVG = new XML(xmlText);
			
			// Set the version attribute to 1.2.
			xmlSVG.@version = "1.2";

			// Set the baseProfile attribute to 'tiny-ps'.
			xmlSVG.@baseProfile = "tiny-ps";

			// Remove x and y attributes.
			delete xmlSVG.@x;
			delete xmlSVG.@y;

			// Insert the <title> tag first.
			var nodeList = xmlSVG.descendants();
			for each (item in nodeList) {
				if (item.localName() == "title") {
					delete xmlSVG[item.name()];
					break;
				}
			}
			xmlSVG.prependChild(new XML('<title>'+filename+'</title>'));
		
			// Check if this svg has <image> element.
			nodeList = xmlSVG.descendants();
			var hasImage = false;
			for each (item in nodeList) {
				if (item.localName() == "image") {
					hasImage = true;
					break;
				}
			}

			if (hasImage == true) {
				alert( 'Active document has a <image> element.\nUnfortunately, <image> elements aren\'t allowed in SVG Tiny Portable/Secure profile.\nSo please try again without <image> element.' );
				destFile.remove();
			}			
			else {
				// Remove the <namedview> element.
				nodeList = xmlSVG.descendants();
				for each (item in nodeList) {
					if (item.localName() == "namedview") {
						delete xmlSVG[item.name()];
						break;
					}
				}
			
				// Remove the disallowed attributes in the <svg> tag.
				{
					// Remove "style" attribute.
					if (xmlSVG.@style != null && xmlSVG.@style != "") {
						var attrs = parseStyleValue(xmlSVG.@style);

						for (var j in attrs) {
							var attr = attrs[j];

							for (var k in SVG_ALLOWED_ATTRIBUTES) {
								if (SVG_ALLOWED_ATTRIBUTES[k] == attr.name) {
									xmlSVG.@[attr.name] = attr.value;
									break;
								}
							}
						}

						delete xmlSVG.@style;
					}
					
					// Remove disallowed attributes.
					for each(var attr in xmlSVG.@["*:*"]) {
						
						if (attr.name().uri.indexOf("xmlns") == -1) {
							var allowed = false;
							for (var k in SVG_ALLOWED_ATTRIBUTES) {
								if (SVG_ALLOWED_ATTRIBUTES[k] == attr.name()) {
									allowed = true;
									break;
								}
							}
							if (allowed == false) {
								delete xmlSVG.@[attr.name()];
							}
						}
					}

					// Remove the overflow, data-name and enable-background attributes in <svg> tag.
					// delete xmlSVG.@overflow;
					// delete xmlSVG.@data-name;
					// delete xmlSVG.@["enable-background"];
				}

				// Remove the disallowed attributes in all children of <svg> tag.
				nodeList = xmlSVG.descendants();
				
				for (var i in nodeList) {
					var node = nodeList[i];

					// Remove the style attribute in all children of <svg> tag.
					if (node.@style != null && node.@style != "") {
						var attrs = parseStyleValue(node.@style);

						for (var j in attrs) {
							var attr = attrs[j];

							node.@[attr.name] = attr.value;
						}

						delete node.@style;
					}
					
					// Remove the disallowed attributes in all children of <svg> tag.
					if (ALLOWED_ATTRIBUTES[node.localName()] != null) {
						for each(var attr in node.@["*:*"]) {	
							if (attr.name().uri.indexOf("xmlns") == -1) {
								var allowed = false;
								var allowed_attributes_list = ALLOWED_ATTRIBUTES[node.localName()];
								for (var k in allowed_attributes_list) {
									if (allowed_attributes_list[k] == attr.name()) {
										allowed = true;
										break;
									}
								}
								if (allowed == false) {
									delete node.@[attr.name()];
								}
							}
						}
					}
				}
				

				// Save as SVG Tiny Portable/Secure again.
				destFile.open("w");
				destFile.write(xmlSVG);
				destFile.close();

				alert( 'Active document saved as SVG Tiny P/S.' );
			}
		}
	}
	else{
		throw new Error('There are no document open!');
	}
}
catch(e) {
	alert( e.message, "Script Alert", true);
}

// Create new empty file with name and extension and folder.
function makeFile(name, ext, folder) {
	var newFile = new File( folder + '/' + name + '.' + ext );
	
	if (newFile.open("w")) {
		newFile.close();
	}
	else {
		throw new Error('Access is denied');
	}
	return newFile;
}

// Parse the style and Making the list of styles.
function parseStyleValue(styles) {
	var styleTexts = styles.split(';');
	var num = styleTexts.length;

	var attrs = [];

	for (var i = num-1; i >= 0; i --) {
		var styleText = styleTexts[i];

		var nameAndValue = styleText.split(':');

		if (nameAndValue.length != 2)
			continue;

		var name = nameAndValue[0];
		var value = nameAndValue[1];

		attrs.push({name: name, value: value});
	}

	return attrs;
}