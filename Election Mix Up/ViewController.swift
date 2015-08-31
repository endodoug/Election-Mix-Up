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
            
            label.center = CGPoint(x: randomX - 05, y: randomY + 10)
            
            view.addSubview(label)
            
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
            
        }
    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        // get translation
        var translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        
        // add dx, dy to current label position
        var label = panGesture.view as! UILabel
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

