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
        
        // Setup and add Subviews
        
        let constraintButton = UIButton(type: .System)
        constraintButton.setTitle("Constraint Example", forState: .Normal)
        constraintButton.translatesAutoresizingMaskIntoConstraints = false
        constraintButton.addTarget(self, action: #selector(JunctionViewController.constraintButtonClicked), forControlEvents: .TouchUpInside)
        
        let anchorButton = UIButton(type: .System)
        anchorButton.setTitle("Anchor Example", forState: .Normal)
        anchorButton.translatesAutoresizingMaskIntoConstraints = false
        anchorButton.addTarget(self, action: #selector(JunctionViewController.anchorButtonClicked), forControlEvents: .TouchUpInside)
        
        let frameButton = UIButton(type: .System)
        frameButton.setTitle("Frame Example", forState: .Normal)
        frameButton.translatesAutoresizingMaskIntoConstraints = false
        frameButton.addTarget(self, action: #selector(JunctionViewController.frameButtonClicked), forControlEvents: .TouchUpInside)
        
        view.addSubview(anchorButton)
        view.addSubview(constraintButton)
        view.addSubview(frameButton)
        view.backgroundColor = UIColor.whiteColor()
        
        // Setup and Activate Constraints
        
        let constraintButtonLeadingConstraint = NSLayoutConstraint(
            item: constraintButton,
            attribute: .LeadingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1.0,
            constant: 8)
        
        let constraintButtonTrailingConstraint = NSLayoutConstraint(
            item: constraintButton,
            attribute: .TrailingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1.0,
            constant: -8)
        
        let constraintButtonTopConstraint = NSLayoutConstraint(
            item: constraintButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TopMargin,
            multiplier: 1.0,
            constant: 80)
        
        let anchorButtonLeadingConstraint = NSLayoutConstraint(
            item: anchorButton,
            attribute: .LeadingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1.0,
            constant: 8)
        
        let anchorButtonTrailingConstraint = NSLayoutConstraint(
            item: anchorButton,
            attribute: .TrailingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1.0,
            constant: -8)
        
        let anchorButtonTopConstraint = NSLayoutConstraint(
            item: anchorButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: constraintButton,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 8)
        
        let frameButtonLeadingConstraint = NSLayoutConstraint(
            item: frameButton,
            attribute: .LeadingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1.0,
            constant: 8)
        
        let frameButtonTrailingConstraint = NSLayoutConstraint(
            item: frameButton,
            attribute: .TrailingMargin,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1.0,
            constant: -8)
        
        let frameButtonTopConstraint = NSLayoutConstraint(
            item: frameButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: anchorButton,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 8)
        
        NSLayoutConstraint.activateConstraints([
            constraintButtonLeadingConstraint,
            constraintButtonTrailingConstraint,
            constraintButtonTopConstraint,
            anchorButtonLeadingConstraint,
            anchorButtonTrailingConstraint,
            anchorButtonTopConstraint,
            frameButtonLeadingConstraint,
            frameButtonTrailingConstraint,
            frameButtonTopConstraint])
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
}
