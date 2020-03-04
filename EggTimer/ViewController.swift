//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create some variables
    let eggTimes = ["Soft": 5.0, "Medium": 7.0, "Hard": 12.0]
    var timer = Timer()
    var secondPassed = 0.0
    var cookTime = 0.0
    @IBOutlet weak var titleDisplay: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    // Main user interactions
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        cookTime = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
            }
    
    // Counter logics and action
    @objc func updateCounter() {
        if secondPassed < cookTime {
            print("\(Float(secondPassed / cookTime)) left")
            secondPassed += 1.0
            progressBar.progress = Float(secondPassed / cookTime)
        }
        
        else{
            timer.invalidate()
            secondPassed = 0.0
        }
        
    }
    
}
