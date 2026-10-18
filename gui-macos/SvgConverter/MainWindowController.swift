//
//  MainWindowController.swift
//  SvgConverter
//
//  Created by Collin Mistr on 11/12/21.
//  Copyright © 2021 mbk. All rights reserved.
//

import Cocoa
import UniformTypeIdentifiers

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
    
    /// Elements SVG Tiny P/S forbids: switch, multimedia, interactivity, scripting and animation.
    /// (<a> is also forbidden but is unwrapped instead so its contents are kept.)
    private let FORBIDDEN_ELEMENTS: Set<String> = [
        "switch", "audio", "video", "animation", "prefetch", "listener", "script", "handler",
        "animate", "set", "animateMotion", "animateColor", "animateTransform", "mpath", "discard", "foreignObject"
    ]
    
    /// Attributes that SVG Tiny P/S only allows with a single fixed value.
    private let REQUIRED_VALUES: [String: String] = [
        "zoomAndPan": "disable", "externalResourcesRequired": "false", "focusable": "false",
        "snapshotTime": "none", "playbackOrder": "all", "timelineBegin": "onLoad", "editable": "none"
    ]
    
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
        
        buildUI()
        updateFileInfo()
    }
    
    private var svgElement: XMLElement!
    private var xmlDoc: XMLDocument!
    private var inputURL: URL?
    
    private var mapStyles:[String:[XMLNode]] = [:]
    private var descendants: [XMLElement] = []
    
    // MARK: - UI
    
    private let dropZone = DropZoneView()
    private let dropIcon = NSImageView()
    private let filePrimaryLabel = NSTextField(labelWithString: "")
    private let fileSecondaryLabel = NSTextField(labelWithString: "")
    private let chooseButton = NSButton(title: "Choose File…", target: nil, action: nil)
    private let titleField = NSTextField()
    private let convertButton = NSButton(title: "Convert", target: nil, action: nil)
    
    private func buildUI() {
        guard let window = window else { return }
        
        // Header
        let appIcon = NSImageView()
        appIcon.image = NSImage(systemSymbolName: "wand.and.stars", accessibilityDescription: nil)
        appIcon.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        appIcon.contentTintColor = .controlAccentColor
        
        let heading = NSTextField(labelWithString: "SVG Tiny 1.2 to SVG Tiny P/S")
        heading.font = .systemFont(ofSize: 17, weight: .semibold)
        let subheading = NSTextField(labelWithString: "Convert an SVG Tiny 1.2 file to the Portable/Secure profile.")
        subheading.font = .systemFont(ofSize: NSFont.smallSystemFontSize)
        subheading.textColor = .secondaryLabelColor
        
        let headingText = NSStackView(views: [heading, subheading])
        headingText.orientation = .vertical
        headingText.alignment = .leading
        headingText.spacing = 2
        
        let header = NSStackView(views: [appIcon, headingText])
        header.spacing = 12
        
        // Drop zone
        dropIcon.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 30, weight: .light)
        dropIcon.contentTintColor = .secondaryLabelColor
        filePrimaryLabel.font = .systemFont(ofSize: NSFont.systemFontSize, weight: .medium)
        filePrimaryLabel.lineBreakMode = .byTruncatingMiddle
        filePrimaryLabel.alignment = .center
        fileSecondaryLabel.font = .systemFont(ofSize: NSFont.smallSystemFontSize)
        fileSecondaryLabel.textColor = .secondaryLabelColor
        chooseButton.target = self
        chooseButton.action = #selector(openDocument(_:))
        
        let dropStack = NSStackView(views: [dropIcon, filePrimaryLabel, fileSecondaryLabel, chooseButton])
        dropStack.orientation = .vertical
        dropStack.spacing = 6
        dropStack.setCustomSpacing(12, after: fileSecondaryLabel)
        dropStack.translatesAutoresizingMaskIntoConstraints = false
        dropZone.addSubview(dropStack)
        dropZone.onDrop = { [weak self] url in self?.loadFile(url: url) }
        
        // Title
        let titleLabel = NSTextField(labelWithString: "Title:")
        titleField.placeholderString = "Title embedded in the converted file"
        let titleGrid = NSGridView(views: [[titleLabel, titleField]])
        titleGrid.rowAlignment = .firstBaseline
        titleGrid.columnSpacing = 8
        
        let outputNote = NSTextField(labelWithString: "The converted file is saved next to the original with a “_tiny_ps.svg” suffix.")
        outputNote.font = .systemFont(ofSize: NSFont.smallSystemFontSize)
        outputNote.textColor = .secondaryLabelColor
        outputNote.lineBreakMode = .byTruncatingTail
        
        // Convert
        convertButton.target = self
        convertButton.action = #selector(generateNewSVG(_:))
        convertButton.keyEquivalent = "\r"
        convertButton.controlSize = .large
        let buttonRow = NSStackView()
        buttonRow.setViews([convertButton], in: .trailing)
        
        let root = NSStackView(views: [header, dropZone, titleGrid, outputNote, buttonRow])
        root.orientation = .vertical
        root.alignment = .leading
        root.spacing = 16
        root.setCustomSpacing(6, after: titleGrid)
        root.setCustomSpacing(20, after: outputNote)
        root.edgeInsets = NSEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
        root.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = NSView()
        contentView.addSubview(root)
        window.contentView = contentView
        
        let innerWidth: CGFloat = -(root.edgeInsets.left + root.edgeInsets.right)
        NSLayoutConstraint.activate([
            root.topAnchor.constraint(equalTo: contentView.topAnchor),
            root.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            root.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            root.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            root.widthAnchor.constraint(equalToConstant: 520),
            
            dropZone.widthAnchor.constraint(equalTo: root.widthAnchor, constant: innerWidth),
            dropZone.heightAnchor.constraint(equalToConstant: 160),
            dropStack.centerXAnchor.constraint(equalTo: dropZone.centerXAnchor),
            dropStack.centerYAnchor.constraint(equalTo: dropZone.centerYAnchor),
            dropStack.leadingAnchor.constraint(greaterThanOrEqualTo: dropZone.leadingAnchor, constant: 16),
            filePrimaryLabel.widthAnchor.constraint(lessThanOrEqualTo: dropZone.widthAnchor, constant: -32),
            
            titleGrid.widthAnchor.constraint(equalTo: root.widthAnchor, constant: innerWidth),
            outputNote.widthAnchor.constraint(equalTo: root.widthAnchor, constant: innerWidth),
            buttonRow.widthAnchor.constraint(equalTo: root.widthAnchor, constant: innerWidth),
        ])
        
        window.initialFirstResponder = titleField
        window.center()
    }
    
    private func updateFileInfo() {
        if let url = inputURL {
            dropIcon.image = NSImage(systemSymbolName: "doc.richtext", accessibilityDescription: nil)
            filePrimaryLabel.stringValue = url.lastPathComponent
            let version = svgElement.attribute(forName: "version")?.stringValue ?? "not set"
            let baseProfile = svgElement.attribute(forName: "baseProfile")?.stringValue ?? "not set"
            fileSecondaryLabel.stringValue = "Version \(version)  ·  Base profile \(baseProfile)"
            fileSecondaryLabel.isHidden = false
            dropZone.toolTip = url.path
            chooseButton.title = "Choose Another File…"
        }
        else {
            dropIcon.image = NSImage(systemSymbolName: "arrow.down.doc", accessibilityDescription: nil)
            filePrimaryLabel.stringValue = "Drop an SVG file here"
            fileSecondaryLabel.isHidden = true
            dropZone.toolTip = nil
            chooseButton.title = "Choose File…"
        }
        convertButton.isEnabled = (inputURL != nil)
    }
    
    // Also handles File > Open… (⌘O) via the responder chain.
    @IBAction func openDocument(_ sender: Any?) {
        let dialog = NSOpenPanel()
        
        dialog.title                   = "Choose an SVG file"
        dialog.showsHiddenFiles        = false
        dialog.canChooseDirectories    = false
        dialog.allowsMultipleSelection = false
        dialog.allowedContentTypes     = [.svg]
        
        dialog.beginSheetModal(for: window!) { [weak self] response in
            if response == .OK, let url = dialog.url {
                self?.loadFile(url: url)
            }
        }
    }
    
    private func loadFile(url: URL) {
        inputURL = nil
        defer { updateFileInfo() }
        
        do {
            // Get the content of the selected file.
            let file_content = try String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
            
            // Parse XML data of the file
            xmlDoc = try XMLDocument.init(xmlString: file_content)
            
            svgElement = xmlDoc.rootElement()
            
            if (svgElement?.name != "svg") {
                dialogOK(message: "Not an SVG file", text: "Choose a different file.")
                return
            }
            
            inputURL = url
            
            // Show the title if has title
            let titles = svgElement.elements(forName: "title")
            titleField.stringValue = titles.first?.stringValue ?? ""
        }
        catch {
            dialogOK(message: "Couldn’t read the file", text: "Make sure it’s a valid SVG file and try again.")
        }
    }
    
    @IBAction func generateNewSVG(_ sender: Any) {
        guard let inputURL = inputURL else { return }
        
        if (titleField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines).count == 0) {
            dialogOK(message: "Title required", text: "Enter a title to embed in the converted file.")
            return
        }
        
        do {
            
            // Check if has <image> elements anywhere in the document
            descendants = []
            getAllDescedants(element: svgElement)
            
            if (descendants.contains { $0.localName == "image" }) {
                dialogOK(message: "Embedded images aren’t allowed", text: "SVG Tiny P/S doesn’t allow <image> elements. Remove them from the file and try again.")
                return
            }
            
            let new_path = (inputURL.path as NSString).deletingPathExtension + "_tiny_ps.svg"
            
            // Set the version to "1.2", Set the base profile to "tiny-ps"
            updateAttribute(element: svgElement, attrName: "version", newValue: "1.2")
            updateAttribute(element: svgElement, attrName: "baseProfile", newValue: "tiny-ps")
            
            // Set the new title
            updateChild(element: svgElement, childName: "title", newValue: titleField.stringValue)
            
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
            
            // Remove forbidden elements, unwrap <a> links, and drop empty <desc> elements
            descendants = []
            getAllDescedants(element: svgElement)
            for element in descendants {
                guard let parent = element.parent as? XMLElement, let name = element.localName else { continue }
                let isEmptyDesc = (name == "desc" && (element.stringValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                if (name == "a") {
                    let index = element.index
                    let children = element.children ?? []
                    element.setChildren(nil)
                    parent.removeChild(at: index)
                    parent.insertChildren(children, at: index)
                }
                else if (FORBIDDEN_ELEMENTS.contains(name) || isEmptyDesc) {
                    parent.removeChild(at: element.index)
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
            
            // Remove event attributes and enforce fixed-value attributes on every element
            descendants = []
            getAllDescedants(element: svgElement)
            for element in [svgElement!] + descendants {
                for attr in element.attributes ?? [XMLNode]() {
                    if let name = attr.name, (name.hasPrefix("on") || name.hasPrefix("ev:")) {
                        element.removeAttribute(forName: name)
                    }
                }
                for (name, value) in REQUIRED_VALUES {
                    element.attribute(forName: name)?.stringValue = value
                }
            }
            
            // Save the document with new file path
            let content = xmlDoc.xmlString
            
            try content.write(to: URL.init(fileURLWithPath: new_path), atomically: false, encoding: .utf8)
            
            showSuccess(outputURL: URL.init(fileURLWithPath: new_path), warnings: specWarnings(content: content))
        }
        catch {
            print("Unexpected error: \(error).")
            dialogOK(message: "Conversion failed", text: "This file couldn’t be converted to SVG Tiny P/S. Check the file or try another one.")
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
    
    func showSuccess(outputURL: URL, warnings: [String]) {
        let alert = NSAlert()
        
        alert.messageText = warnings.isEmpty ? "Conversion complete" : "Converted with warnings"
        alert.informativeText = "Saved as “\(outputURL.lastPathComponent)”."
        if (!warnings.isEmpty) {
            alert.informativeText += "\n\n" + warnings.map { "• " + $0 }.joined(separator: "\n")
        }
        alert.alertStyle = warnings.isEmpty ? .informational : .warning
        alert.addButton(withTitle: "Done")
        alert.addButton(withTitle: "Show in Finder")
        alert.beginSheetModal(for: self.window!) { response in
            if response == .alertSecondButtonReturn {
                NSWorkspace.shared.activateFileViewerSelecting([outputURL])
            }
        }
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
        for existing in element.elements(forName: childName).reversed() {
            element.removeChild(at: existing.index)
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
    
    // MARK: - Spec checks that can't be fixed automatically
    
    func specWarnings(content: String) -> [String] {
        var warnings: [String] = []
        
        let titleLength = titleField.stringValue.count
        if (titleLength > 64) {
            warnings.append("The title is \(titleLength) characters. The spec recommends 64 or fewer.")
        }
        
        let size = content.utf8.count
        if (size > 32 * 1024) {
            let formatted = ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
            warnings.append("The file is \(formatted). The spec recommends no more than 32 KB.")
        }
        
        if (renderedColors().count < 2) {
            warnings.append("The image appears to use fewer than two colors. The spec requires at least two.")
        }
        
        return warnings
    }
    
    /// Approximates the distinct colors the image renders with, including the
    /// default black fill for shapes that don't set or inherit one.
    func renderedColors() -> Set<String> {
        let filledShapes: Set<String> = ["path", "rect", "circle", "ellipse", "polyline", "polygon", "text", "textArea"]
        var colors = Set<String>()
        
        descendants = []
        getAllDescedants(element: svgElement)
        
        for element in [svgElement!] + descendants {
            for attrName in ["fill", "stroke", "stop-color", "solid-color"] {
                if let color = normalizedColor(element.attribute(forName: attrName)?.stringValue) {
                    colors.insert(color)
                }
            }
            
            if (filledShapes.contains(element.localName ?? "") && inheritedFill(element: element) == nil) {
                colors.insert("#000000")
            }
        }
        
        return colors
    }
    
    func inheritedFill(element: XMLElement) -> String? {
        var current: XMLElement? = element
        while let node = current {
            if let fill = node.attribute(forName: "fill")?.stringValue, fill != "inherit" {
                return fill
            }
            current = node.parent as? XMLElement
        }
        return nil
    }
    
    func normalizedColor(_ value: String?) -> String? {
        guard var color = value?.trimmingCharacters(in: .whitespaces).lowercased(), !color.isEmpty else {
            return nil
        }
        if (["none", "inherit", "currentcolor", "transparent"].contains(color) || color.hasPrefix("url(")) {
            return nil
        }
        if (color == "black") { color = "#000000" }
        if (color == "white") { color = "#ffffff" }
        if (color.count == 4 && color.hasPrefix("#")) {
            color = "#" + color.dropFirst().map { "\($0)\($0)" }.joined()
        }
        return color
    }
    
    func getAllDescedants(element: XMLElement) {
        for child in element.children! {
            if let childElement = child as? XMLElement
            {
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

/// Rounded, dashed drop target that accepts a single SVG file.
final class DropZoneView: NSView {
    
    var onDrop: ((URL) -> Void)?
    
    private var isTargeted = false {
        didSet { needsDisplay = true }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        translatesAutoresizingMaskIntoConstraints = false
        registerForDraggedTypes([.fileURL])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        let path = NSBezierPath(roundedRect: bounds.insetBy(dx: 1, dy: 1), xRadius: 10, yRadius: 10)
        let accent = NSColor.controlAccentColor
        
        (isTargeted ? accent.withAlphaComponent(0.12) : NSColor.quaternaryLabelColor.withAlphaComponent(0.08)).setFill()
        path.fill()
        
        path.lineWidth = isTargeted ? 2 : 1.5
        path.setLineDash([6, 4], count: 2, phase: 0)
        (isTargeted ? accent : NSColor.tertiaryLabelColor).setStroke()
        path.stroke()
    }
    
    private func svgURL(from info: NSDraggingInfo) -> URL? {
        let options: [NSPasteboard.ReadingOptionKey: Any] = [
            .urlReadingFileURLsOnly: true,
            .urlReadingContentsConformToTypes: [UTType.svg.identifier],
        ]
        return (info.draggingPasteboard.readObjects(forClasses: [NSURL.self], options: options) as? [URL])?.first
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        guard svgURL(from: sender) != nil else { return [] }
        isTargeted = true
        return .copy
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        isTargeted = false
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        isTargeted = false
        guard let url = svgURL(from: sender) else { return false }
        onDrop?(url)
        return true
    }
}
