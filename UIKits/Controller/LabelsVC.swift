//
//  FirstViewController.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class LabelsVC: UIViewController {
    
    var y: CGFloat = 50
    
    var buttonLbl: UILabel!
    var segmentLbl: UILabel!
    var switchLbl: UILabel!
    var stepperLbl: UILabel!
    var sliderLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createALabel()
        creatingDynamicFontTypes()
        creatingASpecificFont()
        usingSystemStandardFont()
        gettingFontSizeByDefaultFotButtons()
        clippingLabelText()
        customizingLabelText()
        AddingAttributesOneByOneToARangeOfCharacters()
        AddingMultipleAttributes()
    }
    
    func basicLabel(x: CGFloat = 20, y: CGFloat = 50, width: CGFloat = 150, height: CGFloat = 30, text: String = "Hello World", bgColor: UIColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.text = text
        label.backgroundColor = bgColor
        
        return label
    }
    
    func createALabel() {
        let label = basicLabel()
        
        self.view.addSubview(label)
    }
    
    func creatingDynamicFontTypes() {
        y += 50
        
        let myFont = UIFont.preferredFont(forTextStyle: .headline)
        
        let label = basicLabel(y: y)
        label.font = myFont
        
        self.view.addSubview(label)
    }
    
    func creatingASpecificFont() {
        y += 50

        let myFont = UIFont(name: "Georgia-Italic", size: 30)
        
        buttonLbl = basicLabel(y: y, width: 300, height: 50)
        buttonLbl.font = myFont
        
        self.view.addSubview(buttonLbl)
    }
    
    func usingSystemStandardFont() {
        y += 70

        let myFont = UIFont.systemFont(ofSize: 30)
        
        segmentLbl = basicLabel(y: y, width: 300, height: 50)
        segmentLbl.font = myFont
        
        self.view.addSubview(segmentLbl)
    }
    
    func gettingFontSizeByDefaultFotButtons() {
        y += 70

        let size = UIFont.buttonFontSize
        let myFont = UIFont.systemFont(ofSize: size)
        
        switchLbl = basicLabel(y: y, width: 300, height: 50)
        switchLbl.font = myFont
        
        self.view.addSubview(switchLbl)
    }
    
    func clippingLabelText() {
        y += 70

        stepperLbl = basicLabel(y: y, width: 150, height: 30, text: "This is a Beautiful Life")
        stepperLbl.lineBreakMode = .byClipping
        
        self.view.addSubview(stepperLbl)
    }
    
    func customizingLabelText() {
        y += 50

        let color = UIColor.blue
        let shadow = UIColor.lightGray
        
        sliderLbl = basicLabel(y: y, width: 150, height: 30)
        sliderLbl.textColor = color
        sliderLbl.shadowColor = shadow
        sliderLbl.shadowOffset = CGSize(width: 2, height: 2)    // "2" means 2 points
        
        self.view.addSubview(sliderLbl)
    }
    
    func AddingAttributesOneByOneToARangeOfCharacters() {
        y += 50

        let myFont = UIFont.systemFont(ofSize: 30)
        
        //NSAttributedString Configuration
        let myRange = NSRange(0..<5)
        
        let myText = NSMutableAttributedString(string: "Hello World")
        myText.addAttribute(NSAttributedString.Key.font, value: myFont, range: myRange)
        
        //UILabel Configuration
        let label = basicLabel(y: y, width: 150, height: 30)
        
        //Assigning a new value to this property
        //also replaces the value of the text property with the same string data,
        label.attributedText = myText
        
        self.view.addSubview(label)
    }
    
    func AddingMultipleAttributes() {
        y += 50

        let myFont = UIFont.systemFont(ofSize: 30)
        
        //NSAttributedString Configuration
        let myRange = NSRange(0..<5)
        let color = UIColor.red
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black
        shadow.shadowOffset = CGSize(width: 2, height: 2)   // "2" means 2 points
        
        let attributes = [NSAttributedString.Key.font: myFont, .foregroundColor: color, .shadow: shadow]
        
        let myText = NSMutableAttributedString(string: "Hello World")
        myText.setAttributes(attributes, range: myRange)
        
        //UILabel Configuration
        let label = basicLabel(y: y, width: 150, height: 30)
        label.attributedText = myText
        
        self.view.addSubview(label)
        
    }
}

