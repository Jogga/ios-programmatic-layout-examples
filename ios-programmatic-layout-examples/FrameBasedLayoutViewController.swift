//
//  FrameBasedLayoutViewController.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 17.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

class FrameBasedLayoutViewController: UIViewController {
    
    let button = UIButton(type: .System)
    let secondButton = UIButton(type: .System)
    let bodyText = UILabel()
    let profile = UIImageView()
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        setupSubviews(size)
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Frames"
        super.viewDidLoad()
        
        button.setTitle("Alfinator hello", forState: .Normal)
        secondButton.setTitle("Strange Things", forState: .Normal)
        bodyText.text = "What if UILabel decides to add support for special borders, or configurable line heights, or some other visual effects."
        bodyText.numberOfLines = 0
        profile.backgroundColor = UIColor.blackColor()
        
        view.addSubview(button)
        view.addSubview(secondButton)
        view.addSubview(bodyText)
        view.addSubview(profile)
        
        view.backgroundColor = UIColor.whiteColor()
        
        setupSubviews(view.bounds.size)
        
        print(view.bounds.size)
    }
    
    override func viewWillAppear(animated: Bool) {
        print(view.bounds.size)
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        print(view.bounds.size)
        super.viewDidAppear(animated)
    }
    
    func setupSubviews(size: CGSize) {
        
        button.frame = CGRect(
            x: ((size.width - button.intrinsicContentSize().width) / 2),
            y: 30,
            width: button.intrinsicContentSize().width,
            height: button.intrinsicContentSize().height)
        
        secondButton.frame = CGRect(
            x: ((size.width - secondButton.intrinsicContentSize().width) / 2),
            y: (button.frame.maxY + 8),
            width: secondButton.intrinsicContentSize().width,
            height: secondButton.intrinsicContentSize().height)
        
        profile.frame = CGRect(
            x: 8,
            y: secondButton.frame.maxY + 8,
            width: 48,
            height: 48)
        
        let textSize = bodyText.sizeThatFits(CGSize(width: size.width - 24 - profile.frame.width, height: size.height))
        
        bodyText.frame = CGRect(
            x: profile.frame.maxX + 8,
            y: secondButton.frame.maxY + 8,
            width: ceil(textSize.width),
            height: ceil(textSize.height)
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
