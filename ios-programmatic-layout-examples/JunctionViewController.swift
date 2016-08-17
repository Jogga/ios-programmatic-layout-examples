//
//  JunctionViewController.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 16.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

class JunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Examples"
        
        // Setup Buttons
        
        let constraintButton = UIButton(type: .System)
        constraintButton.setTitle("NSLayoutConstraint", forState: .Normal)
        constraintButton.addTarget(self, action: #selector(JunctionViewController.constraintButtonClicked), forControlEvents: .TouchUpInside)
        
        let anchorButton = UIButton(type: .System)
        anchorButton.setTitle("NSLayoutAnchor", forState: .Normal)
        anchorButton.addTarget(self, action: #selector(JunctionViewController.anchorButtonClicked), forControlEvents: .TouchUpInside)
        
        let frameButton = UIButton(type: .System)
        frameButton.setTitle("Frame Based Layout", forState: .Normal)
        frameButton.addTarget(self, action: #selector(JunctionViewController.frameButtonClicked), forControlEvents: .TouchUpInside)
        
        let stackButton = UIButton(type: .System)
        stackButton.setTitle("UIStackView", forState: .Normal)
        stackButton.addTarget(self, action: #selector(JunctionViewController.stackButtonClicked), forControlEvents: .TouchUpInside)
        
        let visualFormatButton = UIButton(type: .System)
        visualFormatButton.setTitle("Visual Format Language", forState: .Normal)
        visualFormatButton.addTarget(self, action: #selector(JunctionViewController.visualFormatLanguageButton), forControlEvents: .TouchUpInside)
        
        // Setup and add StackView
        
        let navStack = UIStackView()
        navStack.translatesAutoresizingMaskIntoConstraints = false
        navStack.alignment = .Center
        navStack.axis = .Vertical
        navStack.distribution = .EqualSpacing
        navStack.spacing = 8
        navStack.addArrangedSubview(constraintButton)
        navStack.addArrangedSubview(anchorButton)
        navStack.addArrangedSubview(frameButton)
        navStack.addArrangedSubview(stackButton)
        navStack.addArrangedSubview(visualFormatButton)
        
        view.addSubview(navStack)
        view.backgroundColor = UIColor.whiteColor()
        
        // Setup and Activate Constraints
        
        let navStackLeadingConstraint = NSLayoutConstraint(
            item: navStack,
            attribute: .LeadingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1.0,
            constant: 8)
        
        let navStackTrailingConstraint = NSLayoutConstraint(
            item: navStack,
            attribute: .TrailingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1.0,
            constant: -8)
        
        let navStackTopConstraint = NSLayoutConstraint(
            item: navStack,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TopMargin,
            multiplier: 1.0,
            constant: 80)
        
        NSLayoutConstraint.activateConstraints([
            navStackLeadingConstraint,
            navStackTrailingConstraint,
            navStackTopConstraint ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func constraintButtonClicked(sender: UIButton!) {
        print("constraint")
    }
    
    func anchorButtonClicked(sender: UIButton!) {
        print("anchor")
    }
    
    func frameButtonClicked(sender: UIButton!) {
        let frameVC = FrameBasedLayoutViewController()
        navigationController?.pushViewController(frameVC, animated: true)
    }
    
    func stackButtonClicked(sender: UIButton!) {
        print("stack")
    }
    
    func visualFormatLanguageButton(sender: UIButton!) {
        print("format")
    }
}
