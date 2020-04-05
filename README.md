# UIKIT

## UILabel
        
        NSAttributedString
        NSMutableAttributedString

## UIProgressView
- frame and bounds property
        
        func customizingProgressBar() {
            //bounds property of subview refers to the view’s Internal Frame
            //(its own coordinate system).
            let width = self.view.bounds.size.width
            
            let progressBar = UIProgressView(progressViewStyle: .default)
            
            //frame property of subview refers to the view’s External Frame
            //(its superview’s coordinate system).
            progressBar.frame = CGRect(x: 0, y: 100, width: width, height: 50)
            progressBar.progress = 0.2
            progressBar.tintColor = UIColor.red
            progressBar.trackTintColor = UIColor.blue
            
            self.view.addSubview(progressBar)
        }

## UIActivityIndicatorView

## UIButton
        
        UIButton.ButtonType.close
        UIButton.ButtonType.contactAdd
        UIButton.ButtonType.detailDisclosure
        UIButton.ButtonType.infoDark
        UIButton.ButtonType.infoLight
        UIButton.ButtonType.roundedRect
        UIButton.ButtonType.system
        UIButton.ButtonType.custom

- button.addtarget(target, action, event)
- tabBarController?.selectedIndex = 0   //switch the tab programmatically


        creatingCustomButtons(type: .custom, y: 150, width: 150) { (button) in
            button.titleLabel?.font = UIFont(name: "Menlo-Bold", size: 22)
            button.setTitleColor(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            
            self.view.addSubview(button)
            
            button.addTarget(self, action: #selector(self.showCounter(_:)), for: .touchUpInside)

        }
        
        //TODO: - button.addTarget(action:)
        @objc func showCounter(_ sender: UIButton) {
            counter += 1
            
            let list = self.tabBarController?.viewControllers
            let controller = list?[0] as! LabelsVC
            controller.myLabel.text = "\(counter)"
            
            //switch tab programmatically
            //        tabBarController?.selectedIndex = 0   //Optional 1
            tabBarController?.selectedViewController = controller   //Optional 2

        }

## UISegmentedControl
- segment.addTarget(target, action, event)
- tabBarController?.selectedIndex = 0   //switch tab programmatically

        func addingNewButtonsToSegmentedControl() {
            let segment = UISegmentedControl(items: ["Yes", "No"])
            segment.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
            segment.insertSegment(withTitle: "Not Sure", at: 2, animated: false)
            
            self.view.addSubview(segment)
            
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
                tabBarController?.selectedViewController = controller   //Optional 2
            }


## UISwitch
- @escaping

        //@escaping: Escaping local variables through type closure parameters to the caller.
        //for expanding manipulating the escaped variables.
        func creatingSwitch(x: CGFloat, y: CGFloat, handler: @escaping (_ switch: UISwitch) -> () ) {
        
            //UISwitch uses the UIView initializer to declare the area of the view,
            //but the size component is ignored because the switch always has a size by default.
            let mySwitch = UISwitch(frame: CGRect(x: x, y: y, width: 0, height: 0))
            
            handler(mySwitch)
            
            self.view.addSubview(mySwitch)
        }

- mySwitch.addtarget(target, action, event)

## UISlider

## UIStepper
