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



