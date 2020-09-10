
/**************************************************************
 * 
 * MIT Open Source License
 *
 * Copyright 2020 @Mouaad Boukiaou
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
**************************************************************/

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Xml.Linq;

namespace svgConverter
{
    public partial class SvgConverter : Form
    {
        private const string AppTitle = "SVG CONVERTER";
        private const string SVGNS = "{http://www.w3.org/2000/svg}";

        private string[] ALLOWED_ELEMENTS_NAME = {
            "circle", "defs", "desc", "ellipse", "g", "line", "linearGradient", "path", "polygon", "polyline", "radialGradient", "rect", "solidColor", "svg", "text", "textArea", "title", "use"
        };

        private string[] SVG_ALLOWED_ATTRIBUTES = {
            "about", "baseProfile", "class", "color", "color-rendering", "content", "contentScriptType", "datatype", "direction", "display-align", "externalResourcesRequired", "fill", "fill-opacity", "fill-rule", "focusable", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "line-increment", "playbackOrder", "preserveAspectRatio", "property", "rel", "resource", "rev", "role", "snapshotTime", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "timelineBegin", "typeof", "unicode-bidi", "vector-effect", "version", "viewBox", "width", "xml:base", "xml:lang", "xml:space", "zoomAndPan"
        };

        private string[] DESC_ALLOWED_ATTRIBUTES = {
            "about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] TITLE_ALLOWED_ATTRIBUTES = {
            "about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] PATH_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "d", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "pathLength", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] RECT_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
        };

        private string[] CIRCLE_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "r", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] LINE_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
        };

        private string[] ELLIPSE_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] POLYLINE_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] POLYGON_ALLOWED_ATTRIBUTES = {
             "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] SOLIDCOLOR_ALLOWED_ATTRIBUTES = {
             "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] TEXTAREA_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
        };

        private string[] LINEARGRADIENT_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
        };

        private string[] RADIALGRADIENT_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "r", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] TEXT_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "editable", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rotate", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
        };

        private string[] G_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] DEFS_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
        };

        private string[] USE_ALLOWED_ATTRIBUTES = {
            "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "href", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
        };
        
        private XDocument m_xdoc;
        private XElement m_emntSvg;

        private Dictionary<string, string[]> ALLOWED_ATTRIBUTES = new Dictionary<string, string[]>();

        public SvgConverter()
        {
            InitializeComponent();

            ALLOWED_ATTRIBUTES.Add("circle", CIRCLE_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("defs", DEFS_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("desc", DESC_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("ellipse", ELLIPSE_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("g", G_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("line", LINE_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("linearGradient", LINEARGRADIENT_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("path", PATH_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("polygon", POLYGON_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("polyline", POLYLINE_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("radialGradient", RADIALGRADIENT_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("rect", RECT_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("solidColor", SOLIDCOLOR_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("svg", SVG_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("text", TEXT_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("textArea",TEXTAREA_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("title", TITLE_ALLOWED_ATTRIBUTES);
            ALLOWED_ATTRIBUTES.Add("use", USE_ALLOWED_ATTRIBUTES);
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            if (edtNewTitle.Text.Trim() == "")
            {
                MessageBox.Show("You must input the title for new SVG Tiny P/S file.", AppTitle, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            try
            {
                if (m_emntSvg.Descendants(SVGNS+"image").Count() > 0)
                {
                    MessageBox.Show("This SVG file has a <image> element.\nHowever, <image> elements aren't allowed in SVG Tiny Portable/Secure profile.\nSo please remake this svg file without <image> elements or try another SVG file.", AppTitle, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                string oriFilePath = edtFilePath1.Text;
                string oriFileName = Path.GetFileNameWithoutExtension(oriFilePath);
                string newFileName = oriFileName + "_tiny_ps";
                string newFilePath = Path.GetDirectoryName(oriFilePath) + Path.DirectorySeparatorChar + newFileName + ".svg";

                // Setting the version attribute to 1.2.
                m_emntSvg.SetAttributeValue("version", "1.2");

                // Setting the baseProfile attribute to 'tiny-ps'.
                m_emntSvg.SetAttributeValue("baseProfile", "tiny-ps");

                // Removing x and y attributes.
                if (m_emntSvg.Attribute("x") != null)
                    m_emntSvg.Attribute("x").Remove();
                if (m_emntSvg.Attribute("y") != null)
                    m_emntSvg.Attribute("y").Remove();

                // Removing the document type.
                if (m_xdoc.DocumentType != null)
                    m_xdoc.DocumentType.Remove();

                // Inserting the <title> tag first.
                XElement emntTitle = m_emntSvg.Element(SVGNS + "title");
                if (emntTitle != null)
                    emntTitle.Remove();
                m_emntSvg.AddFirst(new XElement(SVGNS + "title", edtNewTitle.Text));

                // Removing the style and making a corresponding dictionary.
                var mapStyles = new Dictionary<string, XAttribute[]>();
                
                foreach (XElement emntStyles in m_emntSvg.Descendants(SVGNS+"style"))
                {
                    string styles = emntStyles.Value;

                    StringReader strReader = new StringReader(styles);
                    while (true)
                    {
                        string line = strReader.ReadLine();

                        if (line == null)
                            break;

                        ParseStyleFullLine(line, mapStyles);
                    }

                    emntStyles.Remove();
                    break;
                }

                // Removing <rdf> element.
                foreach (XElement child in m_xdoc.Root.Descendants())
                {
                    if (child.Name.LocalName == "RDF" || child.Name.LocalName == "rdf")
                    {
                        child.Remove();
                        break;
                    }
                }   

                // Removing <namedview> element.
                foreach (XElement child in m_xdoc.Root.Descendants())
                {
                    if (child.Name.LocalName == "namedview")
                    {
                        child.Remove();
                        break;
                    }
                }

                // Removing all attributes in <metadata> element.
                foreach (XElement child in m_xdoc.Root.Descendants())
                {
                    if (child.Name.LocalName == "metadata")
                    {
                        child.RemoveAttributes();
                        break;
                    }
                }

                // Removing the disallowed attributes for <svg> element.
                {
                    // Removing the "style" attribute for <svg> element.
                    XAttribute attrStyle = m_emntSvg.Attribute("style");
                    if (attrStyle != null)
                    {
                        var styleValue = attrStyle.Value;
                        XAttribute[] attributes = ParseStyleValue(m_emntSvg.Name.LocalName, styleValue);

                        foreach (XAttribute attr in attributes)
                        {
                            if (attr == null || SVG_ALLOWED_ATTRIBUTES.Contains(attr.Name.ToString()) == false)
                                continue;
                            m_emntSvg.SetAttributeValue(attr.Name, attr.Value);
                        }
                        attrStyle.Remove();
                    }

                    // Removing the disallowed attributes.
                    List<XAttribute> removeAttrs = new List<XAttribute>();
                    foreach (XAttribute attr in m_emntSvg.Attributes())
                    {
                        if (!attr.Name.NamespaceName.Contains("xmlns") && SVG_ALLOWED_ATTRIBUTES.Contains(attr.Name.ToString()) == false)
                        {
                            removeAttrs.Add(attr);
                        }
                    }

                    foreach (XAttribute attr in removeAttrs)
                    {
                        attr.Remove();
                    }
                }

                // Removing the disallowed attributes for all children of <svg> element.
                foreach (XElement child in m_emntSvg.Descendants())
                {
                    // Removing "class" attribute.
                    XAttribute attrClass = child.Attribute("class");
                    if (attrClass != null)
                    {
                        var styleName = attrClass.Value;
                        if (mapStyles.Count != 0 && mapStyles[styleName] != null)
                        {
                            foreach (XAttribute attr in mapStyles[styleName])
                            {
                                if (attr == null)
                                    continue;
                                child.SetAttributeValue(attr.Name, attr.Value);
                            }
                        }
                        attrClass.Remove();
                    }

                    // Removing "style" attribute.
                    XAttribute attrStyle = child.Attribute("style");
                    if (attrStyle != null)
                    {
                        var styleValue = attrStyle.Value;
                        XAttribute[] attributes = ParseStyleValue(child.Name.LocalName, styleValue);

                        foreach (XAttribute attr in attributes)
                        {
                            if (attr == null)
                                continue;
                            child.SetAttributeValue(attr.Name, attr.Value);
                        }
                        attrStyle.Remove();
                    }

                    // Removing the disallowed attributes.
                    if (ALLOWED_ELEMENTS_NAME.Contains(child.Name.LocalName) == true)
                    {
                        List<XAttribute> removeAttrs = new List<XAttribute>();
                        foreach (XAttribute attr in child.Attributes())
                        {
                            if (ALLOWED_ATTRIBUTES[child.Name.LocalName].Contains(attr.Name.ToString()) == false)
                            {
                                removeAttrs.Add(attr);
                            }
                        }

                        foreach (XAttribute attr in removeAttrs)
                        {
                            attr.Remove();
                        }
                    }
                }

                // Saving the document with new file path.
                m_xdoc.Save(newFilePath);

                MessageBox.Show("Generated the new SVG Tiny Portable/Secure file.\n" + newFilePath, "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch(Exception exception)
            {
                Console.Write(exception);
                MessageBox.Show("You cannot convert this file to SVG Tiny Portable/Secure.\nPlease check the file again or select another file.", AppTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog()
            {
                FileName = "Select a SVG Tiny 1.2 file",
                Filter = "SVG files (*.svg)|*.svg",
                Title = "Open SVG file"
            };

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                edtFilePath1.Text = openFileDialog1.FileName;
                
                // Loading a file with file path.
                try
                {
                    m_xdoc = XDocument.Load(edtFilePath1.Text);
                }
                catch(Exception)
                {
                    MessageBox.Show("Cannot open the file as xml format.", AppTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                m_emntSvg = m_xdoc.Element(SVGNS + "svg");
                if (m_emntSvg == null)
                {
                    MessageBox.Show("This file is not SVG format.\nPlease select another SVG file.", AppTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                // Displaying the version and base profile.
                lblVersion.Text = "Version : " + GetAttributeValue(m_emntSvg, "version");
                lblBaseProfile.Text = "Base Profile : " + GetAttributeValue(m_emntSvg, "baseProfile");

                // Displaying the title of svg file.
                edtNewTitle.Text = GetValueOfChild(m_emntSvg, SVGNS + "title");

                btnGenerate.Enabled = true;
            }
        }

        public void ParseStyleFullLine(string line, Dictionary<string, XAttribute[]> mapStyles)
        {
            if (line == null)
                return;

            line = line.Trim();

            if (line.Length == 0)
                return;

            if (line[0] != '.' || line[line.Length-1] != '}')
                return;

            int first_bracket_pos = line.IndexOf('{');
            if (first_bracket_pos == -1)
                return;

            string styleName = line.Substring(1, first_bracket_pos-1);

            string styleValue = line.Substring(first_bracket_pos + 1, line.Length - first_bracket_pos - 2);
            
            string[] styleTexts = styleValue.Split(';');

            int numOfStyles = styleTexts.Length;

            XAttribute[] attributes = new XAttribute[numOfStyles - 1];

            int count = 0;
            for (int i = numOfStyles-1; i >=0; i --)
            {
                string styleText = styleTexts[i];
                string[] nameAndValue = styleText.Split(':');

                if (nameAndValue.Length != 2)
                    continue;

                string name = nameAndValue[0];
                string value = nameAndValue[1];

                XAttribute attr = new XAttribute(name, value);

                attributes[count++] = attr;
            }

            mapStyles.Add(styleName, attributes);
        }
        
        public XAttribute[] ParseStyleValue(string eleName, string styleValue)
        {
            if (styleValue == null)
                return null;

            string[] styleTexts = styleValue.Split(';');

            int numOfStyles = styleTexts.Length;

            XAttribute[] attributes = new XAttribute[numOfStyles];

            int count = 0;
            for (int i = numOfStyles - 1; i >= 0; i--)
            {
                string styleText = styleTexts[i];
                string[] nameAndValue = styleText.Split(':');

                if (nameAndValue.Length != 2)
                    continue;

                string name = nameAndValue[0];
                string value = nameAndValue[1];
                
                if (ALLOWED_ELEMENTS_NAME.Contains(eleName) == true & ALLOWED_ATTRIBUTES[eleName].Contains(name) == false)
                    continue;

                XAttribute attr = new XAttribute(name, value);

                attributes[count++] = attr;
            }

            return attributes;
        }

        public string GetAttributeValue(XElement element, string attrName)
        {
            XAttribute attr = element.Attribute(XName.Get(attrName));

            if (attr == null)
                return "null";
            else
                return attr.Value;
        }

        public string GetValueOfChild(XElement element, string tagName)
        {
            XElement child = element.Element(tagName);
            if (child == null)
                return "";
            else
                return child.Value;
        }

        public void RemoveAttribute(XElement element, string attrName)
        {
            XAttribute attr = element.Attribute(attrName);
            if (attr != null)
                attr.Remove();
        }
    }
}
