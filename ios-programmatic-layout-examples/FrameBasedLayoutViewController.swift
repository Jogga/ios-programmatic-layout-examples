//
//  FrameBasedLayoutViewController.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 17.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

class FrameBasedLayoutViewController: UIViewController {
    
    let userNameLabel = UILabel()
    let commentLabel = UILabel()
    let profileImage = UIImageView()
    let infoButton = UIButton(type: UIButtonType.InfoLight)
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        configureView(size)
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Frames"
        super.viewDidLoad()
        
        userNameLabel.text = "John Appleseed"
        userNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        
        commentLabel.text = "What if UILabel decides to add support for special borders, or configurable line heights, or some other visual effects."
        commentLabel.numberOfLines = 0
        commentLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        profileImage.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(userNameLabel)
        view.addSubview(commentLabel)
        view.addSubview(profileImage)
        view.addSubview(infoButton)
        
        view.backgroundColor = UIColor.whiteColor()
        
        configureView(view.bounds.size)
        
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
    
    func configureView(size: CGSize) {
        
        let imageSideLength: CGFloat = 48
        let margin: CGFloat = 8
        let availableTextWidth: CGFloat = size.width - (margin * 3) - imageSideLength
        let commentLabelSize = commentLabel.sizeThatFits(CGSize(width: availableTextWidth, height: CGFloat.max))
        let userNameLabelSize = userNameLabel.sizeThatFits(CGSize(width: availableTextWidth, height: CGFloat.max))
        
        profileImage.frame = CGRect(
            x: margin,
            y: 64 + margin,
            width: imageSideLength,
            height: imageSideLength)
        
        userNameLabel.frame = CGRect(
            x: profileImage.frame.maxX + margin,
            y: profileImage.frame.minY,
            width: ceil(userNameLabelSize.width),
            height: ceil(userNameLabelSize.height))
        
        commentLabel.frame = CGRect(
            x: profileImage.frame.maxX + margin,
            y: userNameLabel.frame.maxY + 4,
            width: ceil(commentLabelSize.width),
            height: ceil(commentLabelSize.height))
        
        infoButton.frame = CGRect(
            x: profileImage.frame.maxX + margin,
            y: commentLabel.frame.maxY + margin,
            width: infoButton.frame.width,
            height: infoButton.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
