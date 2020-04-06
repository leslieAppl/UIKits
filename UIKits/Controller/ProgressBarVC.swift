//
//  SecondViewController.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ProgressBarVC: UIViewController {
    var activityIndicatorFlag: Bool!

    var progressBarShort: UIProgressView!
    var progressBarLong: UIProgressView!
    var activityIndicator: UIActivityIndicatorView!
    let button = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingProgressBar()
        customizingProgressBar()
        creatingSlider()
        creatingActivityIndicator()
        creatingButton()
    }
    
    //MARK: UIProgressView
    func creatingProgressBar() {
        progressBarShort = UIProgressView(progressViewStyle: .default)
        
        //width: 200 points (pixcel * scale = point)
        
        //The Progress View has a size by default, but it adapts to the size of its view.
        //Using the 'frame' property inherited from UIView we can resize the bar to our liking.
        progressBarShort.frame = CGRect(x: 50, y: 50, width: 200, height: 0)
        progressBarShort.progress = 0.6
        
        self.view.addSubview(progressBarShort)
    }
    
    func customizingProgressBar() {
        //bounds property of subview refers to the view’s Internal Frame
        //(its own coordinate system).
        let width = self.view.bounds.size.width
        
        progressBarLong = UIProgressView(progressViewStyle: .default)
        
        //frame property of subview refers to the view’s External Frame
        //(its superview’s coordinate system).
        progressBarLong.frame = CGRect(x: 0, y: 100, width: width, height: 50)
//        progressBarLong.progress = 1
        progressBarLong.tintColor = UIColor.red
        progressBarLong.trackTintColor = UIColor.blue
        
        self.view.addSubview(progressBarLong)

    }
    
    //MARK: - UISlider
    func creatingSlider() {
        //bounds property of subview refers to the view’s Internal Frame
        //(its own coordinate system).
        let width = self.view.bounds.size.width - 50

        let slider = UISlider(frame: CGRect(x: 50, y: 150, width: width, height: 0))
        
        self.view.addSubview(slider)
        
        //MARK: 'Value Changed' Event to perform an Action.
        slider.addTarget(self, action: #selector(self.updateProgress(_:)), for: .valueChanged)

    }
    
    @objc func updateProgress(_ sender: UISlider) {
        progressBarShort.progress = sender.value
        progressBarLong.progress = sender.value
    }
    
    //MARK: - UIActivityIndicatorView
    func creatingActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame.origin = CGPoint(x: 50, y: 200)
        activityIndicator.color = UIColor.red
        activityIndicator.startAnimating()
        
        activityIndicatorFlag = true
        
        if activityIndicator.isAnimating {
            print("In Progress")
        }
        
        self.view.addSubview(activityIndicator)
    }
    
    //MARK: - UIButton
    func creatingButton() {
        
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 31)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.backgroundColor = .gray

        switch activityIndicatorFlag {
        case true:
            button.setTitle("Stop", for: .normal)
            button.setTitleColor(.red, for: .normal)
        case false:
            button.setTitle("Start", for: .normal)
            button.setTitleColor(.green, for: .normal)
        case .none:
            return
        case .some(_):
            return
        }

        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(self.stopActivityIndicator(_:)), for: .touchUpInside)
    }
    
    @objc func stopActivityIndicator(_ sender: UIButton) {
        switch activityIndicatorFlag {
        case true:
            activityIndicatorFlag = false
            
            button.setTitle("Start", for: .normal)
            button.setTitleColor(.green, for: .normal)
            
            activityIndicator.stopAnimating()

        default:
            activityIndicatorFlag = true
            
            button.setTitle("Stop", for: .normal)
            button.setTitleColor(.red, for: .normal)
            
            activityIndicator.startAnimating()
        }
    }
}

