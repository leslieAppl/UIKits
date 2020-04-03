//
//  SecondViewController.swift
//  UIKits
//
//  Created by leslie on 4/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ProgressBarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingProgressBar()
        customizingProgressBar()
        creatingActivityIndicator()
    }
    
    //MARK: UIProgressView
    func creatingProgressBar() {
        let progressBar = UIProgressView(progressViewStyle: .default)
        
        //width: 200 points (pixcel * scale = point)
        
        //The Progress View has a size by default, but it adapts to the size of its view.
        //Using the 'frame' property inherited from UIView we can resize the bar to our liking.
        progressBar.frame = CGRect(x: 50, y: 50, width: 200, height: 0)
        progressBar.progress = 0.6
        
        self.view.addSubview(progressBar)
    }
    
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

