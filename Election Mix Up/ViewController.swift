//
//  ViewController.swift
//  Election Mix Up
//
//  Created by doug harper on 8/30/15.
//  Copyright (c) 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addAWordTextField: UITextField!
    @IBOutlet weak var addAWordButton: UIButton!
    @IBOutlet weak var redStateButton: UIButton!
    @IBOutlet weak var blueStateButton: UIButton!
    
    var wordListArray = ["Hillary", "Jeb", "Trump", "Feel the Bern", "is", "the", "candidate", "Rand Paul", "Christie", "Republican", "Democrat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAWordTextField.delegate = self
        
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
            
            label.center = CGPoint(x: randomX - 05, y: randomY + 50)
            
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

    @IBAction func addWordEnterButtonTapped(sender: UIButton) {
        //println("text entry working")
        var newWordListItem = addAWordTextField.text
        wordListArray.append(newWordListItem)
        println(wordListArray.description)
        addAWordTextField.resignFirstResponder()
        
        addNewWord()
    }
    
    func addNewWord () {
        var usersNewWord = addAWordTextField.text
        var label = UILabel()
        label.text = usersNewWord
        label.textColor = UIColor.blueColor()
        label.font = UIFont.systemFontOfSize(32)
        label.sizeToFit()
        label.backgroundColor = UIColor.whiteColor()
        label.center = CGPoint(x: 150, y: 200)
        
        var randomX = CGFloat(arc4random_uniform(300))
        var randomY = CGFloat(arc4random_uniform(480))
        
        label.center = CGPoint(x: randomX - 05, y: randomY + 50)
        
        view.addSubview(label)
        
        var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
        label.addGestureRecognizer(panGesture)
        label.userInteractionEnabled = true
        
        addAWordTextField.text = ""
        
        addAWordTextField.hidden = true
        addAWordButton.hidden = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addNewWord()
        addAWordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func blueStateButtonTapped(sender: UIButton) {
        view.backgroundColor = UIColor.blueColor()
        
    }
    
    @IBAction func redStateButtonTapped(sender: UIButton) {
        view.backgroundColor = UIColor.redColor()
    }

}

