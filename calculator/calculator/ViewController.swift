//
//  ViewController.swift
//  calculator
//
//  Created by Ryan Zhu on 6/14/15.
//  Copyright (c) 2015 xuan.zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var digit: UILabel!
    
    var isFirstClick = true


    @IBAction func cal(sender: UIButton) {
        let display = sender.currentTitle
        if(!isFirstClick){
            digit.text=digit.text!+display!
        }else{
            digit.text=display
            isFirstClick = false
        }
        println("value is \(display)")
    }
}

