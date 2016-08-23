//
//  StackViewLayoutViewController.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 23.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

class StackViewLayoutViewController: UIViewController {

    let userNameLabel = UILabel()
    let commentLabel = UILabel()
    let profileImage = UIImageView()
    let infoButton = UIButton(type: UIButtonType.InfoLight)
    let mediaItem = MediaItem()
    
    override func loadView() {
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = .whiteColor()
        
        let verticalStackView = UIStackView()
        let horizontalStackView = UIStackView()
        let buttonStackView = UIStackView()
        
        buttonStackView.alignment = .Leading
        buttonStackView.axis = .Horizontal
        buttonStackView.distribution = .EqualSpacing
        buttonStackView.addArrangedSubview(infoButton)
        
        verticalStackView.axis = .Vertical
        verticalStackView.distribution = .EqualSpacing
        verticalStackView.addArrangedSubview(userNameLabel)
        verticalStackView.addArrangedSubview(commentLabel)
        verticalStackView.addArrangedSubview(buttonStackView)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .Horizontal
        horizontalStackView.alignment = .Leading
        horizontalStackView.distribution = .EqualSpacing
        horizontalStackView.addArrangedSubview(profileImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        view.addSubview(horizontalStackView)
        
        let mediaItemLeadingConstraint = NSLayoutConstraint(
            item: horizontalStackView,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Leading,
            multiplier: 1,
            constant: LayoutConstants.margin)
        
        let mediaItemTopConstraint = NSLayoutConstraint(
            item: horizontalStackView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1,
            constant: (LayoutConstants.navBarHeight + LayoutConstants.margin))
        
        let mediaItemTrailingConstraint = NSLayoutConstraint(
            item: horizontalStackView,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Trailing,
            multiplier: 1,
            constant: LayoutConstants.margin)
        
        NSLayoutConstraint.activateConstraints([
            mediaItemTopConstraint,
            mediaItemLeadingConstraint,
            mediaItemTrailingConstraint])
    }
    
    override func viewDidLoad() {
        userNameLabel.text = mediaItem.userName
        commentLabel.text = mediaItem.comment
        profileImage.image = UIImage(named: mediaItem.profileImage)
    }
}
