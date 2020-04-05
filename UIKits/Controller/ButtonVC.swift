//
//  ButtonVC.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {
    
    var counter: Int = 0
    
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
            
            //MARK: 'Touch UP Inside' Event to perform an Action.
            button.addTarget(self, action: #selector(self.showCounter(_:)), for: .touchUpInside)
            
        }
        
        //UISegmentedControl
        creatingSegmentedControl()
        modifyingSegmentedControl()
        addingNewButtonsToSegmentedControl()
        
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
            
            //MARK: 'Value Changed' Event to perform an Action.
            mySwitch.addTarget(self, action: #selector(self.switchColor(_:)), for: .valueChanged)

        }
        
        //Setting the values for the slider
        creatingSlider(x: 100, y: 420, width: 200, height: 31) { (slider) in
            slider.value = 0.6
        }
        
        //Changeing the colors of the Slider
        creatingSlider(x: 100, y: 470, width: 250, height: 31) { (slider) in
            slider.value = 0.9
            slider.minimumTrackTintColor = UIColor.red
            slider.maximumTrackTintColor = UIColor.blue
        }
        
        //Cteating a Stepper
        creatingStepper(x: 100, y: 520) { (_) in }
        
        //Setting the values for the Stepper
        creatingStepper(x: 100, y: 570) { (stepper) in
            stepper.value = 4.0
            stepper.minimumValue = 1.0
            stepper.maximumValue = 9.0
            stepper.stepValue = 0.5
        }
        
    }
        
    //MARK: - UIButton - Simple
    func creatingSimpleButtons(type: UIButton.ButtonType, x: CGFloat = 50, y: CGFloat = 50) {
        let button = UIButton(type: type)
        button.frame.origin = CGPoint(x: x, y: y)
        
        self.view.addSubview(button)
    }
    
    //MARK: - UIButton - System and Custom
    //@escaping: Escaping local variables through type closure parameters to the caller.
    //for expanding manipulating the escaped variables.
    func creatingCustomButtons(type: UIButton.ButtonType, x: CGFloat = 100, y: CGFloat = 50, width: CGFloat = 100, height: CGFloat = 32, handler: @escaping (_ button: UIButton) -> ()) {
        
        let button = UIButton(type: type)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitle("Tap Here", for: .normal)
        
        handler(button)
        
    }
    
    //button.addTarget(action:)
    @objc func showCounter(_ sender: UIButton) {
        counter += 1
        
        let list = self.tabBarController?.viewControllers
        let controller = list?[0] as! LabelsVC
        controller.buttonLbl.text = "\(counter)"
        
        //switch tab programmatically
        tabBarController?.selectedIndex = 0   //Optional 1
        //        tabBarController?.selectedViewController = controller   //Optional 2
    }
        
    //MARK: - UISegmentedControl
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
        
        //MARK: 'Value Changed' Event to perform an Action.
        segment.addTarget(self, action: #selector(self.selectColor(_:)), for: .valueChanged)
    }
    
    @objc func selectColor(_ sender: UISegmentedControl) {
        let list = tabBarController?.viewControllers
        let controller = list?[0] as! LabelsVC
        
        if sender.selectedSegmentIndex == 0 {
            controller.segmentLbl.text = "Yes"
            controller.segmentLbl.backgroundColor = .green
        } else if sender.selectedSegmentIndex == 1 {
            controller.segmentLbl.text = "No"
            controller.segmentLbl.backgroundColor = .red
        } else if sender.selectedSegmentIndex == 2 {
            controller.segmentLbl.text = "Not Sure"
            controller.segmentLbl.backgroundColor = .blue
        }
        
        //Switch tab programmatically
//        self.tabBarController?.show(controller, sender: self)     //Error
//        self.tabBarController?.present(controller, animated: true, completion: nil)   //Error
        tabBarController?.selectedIndex = 0     //Optional 1
//        tabBarController?.selectedViewController = controller   //Optional 2
    }
    
    
    //MARK: - UISwitch
    //@escaping: Escaping local variables through type closure parameters to the caller.
    //for expanding manipulating the escaped variables.
    func creatingSwitch(x: CGFloat, y: CGFloat, handler: @escaping (_ switch: UISwitch) -> () ) {
        //UISwitch uses the UIView initializer to declare the area of the view,
        //but the size component is ignored because the switch always has a size by default.
        let mySwitch = UISwitch(frame: CGRect(x: x, y: y, width: 0, height: 0))
        
        handler(mySwitch)
        
        self.view.addSubview(mySwitch)
        
        
    }
    
    @objc func switchColor(_ sender: UISwitch) {
        let list = tabBarController?.viewControllers
        let controller = list?[0] as! LabelsVC

        if sender.isOn {
            controller.switchLbl.text = "On"
            controller.switchLbl.backgroundColor = .red
        } else {
            controller.switchLbl.text = "Off"
            controller.switchLbl.backgroundColor = .gray
        }
        
        tabBarController?.selectedIndex = 0
    }
    
    //MARK: - UISlider
    func creatingSlider(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, handler: @escaping (_ slider: UISlider) -> ()) {
        let slider = UISlider(frame: CGRect(x: x, y: y, width: width, height: height))
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        
        handler(slider)
        
        self.view.addSubview(slider)
    }
    
    //MARK: - UIStepper
    func creatingStepper(x: CGFloat, y: CGFloat, handler: @escaping (_ stepper: UIStepper) -> ()) {
        let stepper = UIStepper(frame: CGRect(x: x, y: y, width: 0, height: 0))
        
        handler(stepper)
        
        self.view.addSubview(stepper)
    }
    
}
