//
//  SecondViewController.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ProgressBarVC: UIViewController {
    
    var progressBarShort: UIProgressView!
    var progressBarLong: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingProgressBar()
        customizingProgressBar()
        creatingSlider()
        creatingActivityIndicator()
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
        let progress = UIActivityIndicatorView(style: .medium)
        progress.frame.origin = CGPoint(x: 50, y: 200)
        progress.color = UIColor.red
        progress.startAnimating()
        
        if progress.isAnimating {
            print("In Progress")
        }
        
        self.view.addSubview(progress)
    }
    
}

