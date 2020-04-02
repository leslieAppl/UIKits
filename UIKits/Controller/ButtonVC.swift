//
//  ButtonVC.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIButton - Simple
        creatingSimpleButtons(type: .close)
        creatingSimpleButtons(type: .contactAdd, y: 100)
        creatingSimpleButtons(type: .detailDisclosure, y: 150)
        creatingSimpleButtons(type: .infoDark, y: 200)
        creatingSimpleButtons(type: .infoLight, y: 250)
        creatingSimpleButtons(type: .roundedRect, y: 300)
        
        //UIButton - System and Custom
        creatingCustomButtons(type: .system) { (button) in
            button.setTitleColor(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            
            self.view.addSubview(button)
        }
        
        creatingCustomButtons(type: .custom, y: 100) { (button) in
            
            button.setTitleColor(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            
            self.view.addSubview(button)
        }
        
        creatingCustomButtons(type: .custom, y: 150, width: 150) { (button) in
            button.titleLabel?.font = UIFont(name: "Menlo-Bold", size: 22)
            button.setTitleColor(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            
            self.view.addSubview(button)
        }
        
        //UISegmentedControl
        creatingSegmentedControl()
        modifyingSegmentedControl()
        addingNewButtonsToSegmentedControl()
        
        //UISwitch
        //Creating a switch
        creatingSwitch(x: 100, y: 370) { (_) in }
        
        //Switching the switch on
        creatingSwitch(x: 200, y: 370) { (mySwitch) in
            if !mySwitch.isOn {
                mySwitch.setOn(true, animated: true)
            }
        }
        
        //Changing the colors of the switch
        creatingSwitch(x: 300, y: 370) { (mySwitch) in
            let colorBackground = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0)
            let colorButton = UIColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
            
            mySwitch.onTintColor = colorBackground
            mySwitch.tintColor = colorBackground
            mySwitch.thumbTintColor = colorButton
        }
        
    }
    
    func creatingSimpleButtons(type: UIButton.ButtonType, x: CGFloat = 50, y: CGFloat = 50) {
        let button = UIButton(type: type)
        button.frame.origin = CGPoint(x: x, y: y)
        
        self.view.addSubview(button)
    }
    
    //@escaping: Escaping local variables through type closure parameters to the caller.
    //for expanding manipulating the escaped variables.
    func creatingCustomButtons(type: UIButton.ButtonType, x: CGFloat = 100, y: CGFloat = 50, width: CGFloat = 100, height: CGFloat = 32, handler: @escaping (_ button: UIButton) -> ()) {
        
        let button = UIButton(type: type)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitle("Tap Here", for: .normal)
        
        handler(button)
    }
    
    func creatingSegmentedControl() {
        let segment = UISegmentedControl(items: ["Yes", "No"])
        segment.frame.origin = CGPoint(x: 100, y: 200)
        segment.selectedSegmentIndex = 1
        
        self.view.addSubview(segment)
    }
    
    func modifyingSegmentedControl() {
        let segment = UISegmentedControl(items: ["Yes", "No"])
        segment.frame = CGRect(x: 100, y: 250, width: 200, height: 30)
        segment.setTitle("Agree", forSegmentAt: 0)
        
        self.view.addSubview(segment)
    }
    
    func addingNewButtonsToSegmentedControl() {
        let segment = UISegmentedControl(items: ["Yes", "No"])
        segment.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        segment.insertSegment(withTitle: "Not Sure", at: 2, animated: false)
        
        self.view.addSubview(segment)
    }
    
    //@escaping: Escaping local variables through type closure parameters to the caller.
    //for expanding manipulating the escaped variables.
    func creatingSwitch(x: CGFloat, y: CGFloat, handler: @escaping (_ switch: UISwitch) -> () ) {
        //UISwitch uses the UIView initializer to declare the area of the view,
        //but the size component is ignored because the switch always has a size by default.
        let mySwitch = UISwitch(frame: CGRect(x: x, y: y, width: 0, height: 0))
        
        handler(mySwitch)
        
        self.view.addSubview(mySwitch)
    }

}
