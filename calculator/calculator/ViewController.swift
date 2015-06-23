//
//  ViewController.swift
//  calculator
//
//  Created by Ryan Zhu on 6/14/15.
//  Copyright (c) 2015 xuan.zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber = false
    
    var brain = CalculatorBrain()


    /*this is append digit*/
    @IBAction func cal(sender: UIButton) {
        let digit = sender.currentTitle
        if(userIsInTheMiddleOfTypingNumber){
            display.text=display.text!+digit!
        }else{
            display.text=digit
            userIsInTheMiddleOfTypingNumber = true
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber=false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text="\(newValue)"
            userIsInTheMiddleOfTypingNumber=false
        }
    }
}

