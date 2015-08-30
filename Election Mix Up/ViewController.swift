//
//  ViewController.swift
//  Election Mix Up
//
//  Created by doug harper on 8/30/15.
//  Copyright (c) 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var wordListArray = ["Hillary", "Jeb", "Trump", "Feel the Bern", "is", "the", "candidate", "Rand Paul", "Christie", "Republican", "Democrat"]
        
        view.backgroundColor = UIColor.blueColor()
        
        for word in wordListArray {
            var label = UILabel()
            label.text = word
            label.textColor = UIColor.blueColor()
            label.font = UIFont.systemFontOfSize(32)
            label.sizeToFit()
            label.backgroundColor = UIColor.whiteColor()
            label.center = CGPoint(x: 150, y: 200)
            
            var randomX = CGFloat(arc4random_uniform(300))
            var randomY = CGFloat(arc4random_uniform(480))
            
            label.center = CGPoint(x: randomX - 5, y: randomY)
            
            view.addSubview(label)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

