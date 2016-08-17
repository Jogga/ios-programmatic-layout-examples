//
//  FrameBasedLayoutViewController.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 17.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

class FrameBasedLayoutViewController: UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.title = "Frame Layout Example"
        super.viewDidLoad()

        let button = UIButton(type: .System)
        button.setTitle("Alfinator hello", forState: .Normal)
        
        let secondButton = UIButton(type: .System)
        secondButton.setTitle("Strange Things", forState: .Normal)
        
        button.frame = CGRect(
            x: ((view.bounds.size.width - button.intrinsicContentSize().width) / 2),
            y: 30,
            width: button.intrinsicContentSize().width,
            height: button.intrinsicContentSize().height)
        
        secondButton.frame = CGRect(
            x: ((view.bounds.size.width - secondButton.intrinsicContentSize().width) / 2),
            y: (button.frame.maxY + 8),
            width: secondButton.intrinsicContentSize().width,
            height: secondButton.intrinsicContentSize().height)
        
        view.addSubview(button)
        view.addSubview(secondButton)
        view.backgroundColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
