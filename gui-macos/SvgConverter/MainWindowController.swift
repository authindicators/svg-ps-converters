//
//  MainWindowController.swift
//  SvgConverter
//
//  Created by Collin Mistr on 11/12/21.
//  Copyright © 2021 mbk. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    
    private var SVG_ALLOWED_ATTRIBUTES: [String] = [
        "about", "baseProfile", "class", "color", "color-rendering", "content", "contentScriptType", "datatype", "direction", "display-align", "externalResourcesRequired", "fill", "fill-opacity", "fill-rule", "focusable", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "line-increment", "playbackOrder", "preserveAspectRatio", "property", "rel", "resource", "rev", "role", "snapshotTime", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "timelineBegin", "typeof", "unicode-bidi", "vector-effect", "version", "viewBox", "width", "xml:base", "xml:lang", "xml:space", "zoomAndPan"
    ]
    
    private var DESC_ALLOWED_ATTRIBUTES: [String] = [
        "about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var TITLE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "buffered-rendering", "class", "content", "datatype", "display", "id", "image-rendering", "property", "rel", "requiredFonts", "resource", "rev", "role", "shape-rendering", "systemLanguage", "text-rendering", "typeof", "viewport-fill", "viewport-fill-opacity", "visibility", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var PATH_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "d", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "pathLength", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var RECT_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
    ]
    
    private var CIRCLE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "r", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var LINE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
    ]
    
    private var ELLIPSE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rx", "ry", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var POLYLINE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var POLYGON_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "points", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var SOLIDCOLOR_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var TEXTAREA_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "height", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "width", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
    ]
    
    private var LINEARGRADIENT_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "x1", "x2", "xml:base", "xml:id", "xml:lang", "xml:space", "y1", "y2"
    ]
    
    private var RADIALGRADIENT_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "cx", "cy", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "gradientUnits", "id", "line-increment", "property", "r", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var TEXT_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "editable", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "rotate", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
    ]
    
    private var G_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var DEFS_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "id", "line-increment", "property", "rel", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "text-align", "text-anchor", "typeof", "unicode-bidi", "vector-effect", "xml:base", "xml:id", "xml:lang", "xml:space"
    ]
    
    private var USE_ALLOWED_ATTRIBUTES: [String] = [
        "about", "class", "color", "color-rendering", "content", "datatype", "direction", "display-align", "fill", "fill-opacity", "fill-rule", "font-family", "font-size", "font-style", "font-variant", "font-weight", "href", "id", "line-increment", "property", "rel", "requiredFonts", "resource", "rev", "role", "solid-color", "solid-opacity", "stop-color", "stop-opacity", "stroke", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke-width", "systemLanguage", "text-align", "text-anchor", "transform", "typeof", "unicode-bidi", "vector-effect", "x", "xml:base", "xml:id", "xml:lang", "xml:space", "y"
    ]
    
    private var ALLOWED_ATTRIBUTES: [String: [String]] = [:]
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        /// Do any additional setup after loading the view.
        ALLOWED_ATTRIBUTES["circle"] = CIRCLE_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["defs"] = DEFS_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["desc"] = DESC_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["ellipse"] = ELLIPSE_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["g"] = G_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["line"] = LINE_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["linearGradient"] = LINEARGRADIENT_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["path"] = PATH_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["polygon"] = POLYGON_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["polyline"] = POLYLINE_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["radialGradient"] = RADIALGRADIENT_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["rect"] = RECT_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["solidColor"] = SOLIDCOLOR_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["svg"] = SVG_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["text"] = TEXT_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["textArea"] = TEXTAREA_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["title"] = TITLE_ALLOWED_ATTRIBUTES
        ALLOWED_ATTRIBUTES["use"] = USE_ALLOWED_ATTRIBUTES
    }
    
    private var svgElement: XMLElement!
    private var xmlDoc: XMLDocument!
    
    private var mapStyles:[String:[XMLNode]] = [:]
    private var descendants: [XMLElement] = []
    
    @IBOutlet weak var generate_btn: NSButton!
    @IBOutlet weak var filepath_field: NSTextField!
    @IBOutlet weak var version_field: NSTextField!
    @IBOutlet weak var baseProfile_field: NSTextField!
    @IBOutlet weak var newTitle_field: NSTextField!
    
    @IBAction func selectInputFile(_ sender: NSButton) {
        let dialog = NSOpenPanel()
        
        dialog.title                   = "Choose a .svg file"
        dialog.showsResizeIndicator    = true
        dialog.showsHiddenFiles        = false
        dialog.canChooseDirectories    = true
        dialog.canCreateDirectories    = true
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes        = ["svg"]
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            generate_btn.isEnabled = false
            
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                filepath_field.stringValue = path
                
                do {
                    
                    // Get the content of the selected file.
                    let file_content = try String(contentsOfFile: path, encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
                    
                    // Parse XML data of the file
                    xmlDoc = try XMLDocument.init(xmlString: file_content)
                    
                    svgElement = xmlDoc.rootElement()
                    
                    if (svgElement?.name != "svg") {
                        dialogOK(message: "INPUT ERROR", text: "This file is not SVG format.\nPlease select another SVG file.")
                        return
                    }
                    
                    // Show the version and base profile of the selected svg file
                    let version = svgElement?.attribute(forName: "version")?.stringValue
                    let baseProfile = svgElement?.attribute(forName: "baseProfile")?.stringValue
                    
                    version_field.stringValue = "Version : " + (version != nil ? version! : "")
                    baseProfile_field.stringValue = "Base Profile : " + (baseProfile != nil ? baseProfile! : "")
                    
                    // Show the title if has title
                    let titles = svgElement.elements(forName: "title")
                    
                    if (titles.count > 0) {
                        newTitle_field.stringValue = titles[0].stringValue!
                    }
                    else {
                        newTitle_field.stringValue = ""
                    }
                    
                    generate_btn.isEnabled = true
                }
                catch {
                    dialogOK(message: "READING ERROR", text: "Cannot read the file. Please try again!")
                }
                
            }
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    @IBAction func generateNewSVG(_ sender: Any) {
        if (newTitle_field.stringValue.trimmingCharacters(in: .whitespacesAndNewlines).count == 0) {
            dialogOK(message: "EMPTY TITLE", text: "You must input the title for new SVG Tiny P/S file.")
            return
        }
        
        do {
            
            // Check if has <image> elements
            let imageElements = svgElement.elements(forName: "image")
            
            if (imageElements.count > 0) {
                dialogOK(message: "ERROR", text: "This SVG file has a <image> element.\nHowever, <image> elements aren't allowed in SVG Tiny Portable/Secure profile.\nSo please remake this svg file without <image> elements or try another SVG file.")
                return
            }
            
            let path: NSString = filepath_field.stringValue as NSString
            
            let new_path = path.deletingPathExtension + "_tiny_ps.svg"
            
            // Set the version to "1.2", Set the base profile to "tiny-ps"
            updateAttribute(element: svgElement, attrName: "version", newValue: "1.2")
            updateAttribute(element: svgElement, attrName: "baseProfile", newValue: "tiny-ps")
            
            // Set the new title
            updateChild(element: svgElement, childName: "title", newValue: newTitle_field.stringValue)
            
            // Remove the document type(<!DOCTYPE>)
            xmlDoc.dtd = nil
            
            // Remove the <rdf> & <namedview> element
            var styleElement: XMLElement? = nil
            descendants = []
            getAllDescedants(element: svgElement)
            for element in descendants {
                if (element.localName == "style") {
                    styleElement = element
                }
                if (element.localName == "rdf" || element.localName == "RDF") {
                    (element.parent as! XMLElement).removeChild(at: element.index)
                }
                else if(element.localName == "namedview") {
                    (element.parent as! XMLElement).removeChild(at: element.index)
                }
            }
            
            // Remove the <style> element and Make the corresponding dictionary
            mapStyles = [:]
            if (styleElement != nil) {
                let styles = styleElement!.stringValue!
                let lines = styles.components(separatedBy: .newlines)
                for line in lines {
                    parseStyleWithBrackets(line: line)
                }
                (styleElement!.parent as! XMLElement).removeChild(at: styleElement!.index)
            }
            
            // Remove all attributes of <metadata> element
            let mdElements = svgElement.elements(forName: "metadata")
            if (mdElements.count > 0) {
                for attr in (mdElements[0].attributes ?? [XMLNode]()).reversed() {
                    mdElements[0].removeAttribute(forName: attr.name!)
                }
            }
            
            // Remove the <style> attribute in <svg> element
            let styleAttr = svgElement.attribute(forName: "style")
            if (styleAttr != nil) {
                let styleValue = styleAttr?.stringValue
                
                let attributes = parseStyleValue(styleValue: styleValue!)
                
                for attr in attributes {
                    svgElement.addAttribute(attr)
                }
                
                svgElement.removeAttribute(forName: "style")
            }
            
            // Remove the disallowed attributes in <svg> element
            for attr in svgElement.attributes ?? [XMLNode]() {
                if (attr.name?.contains("xmlns") == true) {
                    continue
                }
                if ((ALLOWED_ATTRIBUTES["svg"]?.contains(attr.name!)) == false) {
                    svgElement.removeAttribute(forName: attr.name!)
                }
            }
            
            // Remove the disallowed attributes in all children of <svg> element
            descendants = []
            getAllDescedants(element: svgElement)
            
            for element in descendants {
                // Remove the class attribute
                let cssAttr = element.attribute(forName: "class")
                if (cssAttr != nil) {
                    let styleName = (cssAttr?.stringValue)!
                    if (mapStyles.count > 0 && mapStyles[styleName] != nil) {
                        for attr in mapStyles[styleName]! {
                            element.addAttribute(attr)
                        }
                    }
                    element.removeAttribute(forName: "class")
                }
                
                // Remove the style attribute
                let styleAttr = element.attribute(forName: "style")
                if (styleAttr != nil) {
                    let styleValue = styleAttr?.stringValue
                    
                    let attributes = parseStyleValue(styleValue: styleValue!)
                    
                    for attr in attributes {
                        element.addAttribute(attr)
                    }
                    
                    element.removeAttribute(forName: "style")
                }
                
                // Remove the disallowed attributes in <svg> element
                for attr in element.attributes ?? [XMLNode]() {
                    if (attr.name?.contains("xmlns") == true) {
                        continue
                    }
                    if ((ALLOWED_ATTRIBUTES[element.name!]?.contains(attr.name!)) == false) {
                        element.removeAttribute(forName: attr.name!)
                    }
                }
            }
            
            // Save the document with new file path
            let content = xmlDoc.xmlString
            
            try content.write(to: URL.init(fileURLWithPath: new_path), atomically: false, encoding: .utf8)
            
            dialogOK(message: "Congratulations!", text: "Generated the new SVG Tiny Portable/Secure file.\n"+new_path)
        }
        catch {
            print("Unexpected error: \(error).")
            dialogOK(message: "ERROR", text: "You cannot convert this file to SVG Tiny Portable/Secure.\nPlease check the file again or select another file.")
        }
    }
    
    func dialogOK(message: String, text: String) {
        let alert = NSAlert()
        
        alert.messageText = message
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        alert.beginSheetModal(for: self.window!)
    }
    
    func updateAttribute(element: XMLElement, attrName: String, newValue: String) {
        if (element.attribute(forName: attrName) != nil) {
            element.attribute(forName: attrName)?.stringValue = newValue
        }
        else {
            svgElement.addAttribute(XMLNode.attribute(withName: attrName, stringValue: newValue) as! XMLNode)
        }
    }
    
    func updateChild(element: XMLElement, childName: String, newValue: String) {
        if (element.elements(forName: childName).count > 0) {
            element.removeChild(at: element.elements(forName: childName)[0].index)
        }
        
        element.insertChild(XMLNode.element(withName: childName, stringValue: newValue) as! XMLNode, at: 0)
    }
    
    func parseStyleValue(styleValue: String) -> [XMLNode] {
        let value = styleValue.trimmingCharacters(in: .whitespacesAndNewlines)
        if (value.count == 0) {
            return [XMLNode]()
        }
        
        let stylePlains = value.split(separator: ";")
        
        var attributes = [XMLNode]()
        
        for stylePlain in stylePlains {
            let nameAndVal = stylePlain.split(separator: ":")
            
            if (nameAndVal.count != 2) {
                continue
            }
            
            let name = String(nameAndVal[0])
            let value = String(nameAndVal[1])
            
            let attr = XMLNode.attribute(withName: String(name), stringValue: String(value)) as! XMLNode
            
            attributes.append(attr)
        }
        
        return attributes
    }
    
    func parseStyleWithBrackets(line: String) {
        let styleLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (styleLine.count == 0) {
            return
        }
        
        if ((styleLine[0] != String(".")) || (styleLine[styleLine.count-1] != String("}"))) {
            return
        }
        
        let open_bracket_pos = styleLine.index(c: "{")
        if (open_bracket_pos == -1) {
            return
        }
        
        let styleName = styleLine[1 ..< open_bracket_pos]
        let styleValue = styleLine[open_bracket_pos+1 ..< styleLine.count-1]
        
        let attributes = parseStyleValue(styleValue: styleValue)
        
        mapStyles[styleName] = attributes
    }
    
    func getAllDescedants(element: XMLElement) {
        for child in element.children! {
            if (child.className.contains("XMLElement") == true)
            {
                let childElement = child as! XMLElement
                
                if (childElement.children != nil && childElement.children?.count != 0) {
                    getAllDescedants(element: childElement)
                }
                
                descendants.append(childElement)
            }
        }
    }
}

extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    func index(c: Character) -> Int {
        for i in 0..<length {
            if self[i] == String(c) {
                return i
            }
        }
        return -1
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}
