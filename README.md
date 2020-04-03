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

## UISegmentedControl

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

## UISlider

## UIStepper
