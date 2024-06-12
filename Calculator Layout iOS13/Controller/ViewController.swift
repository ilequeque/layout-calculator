//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Iliyas Shakhabdin on 11.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcmethod = sender.currentTitle{
            if let result = calculator.calculate(symbol: calcmethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numVal = sender.currentTitle{
            
            if isFinishedTypingNumber == true{
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            } else {
                if numVal == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numVal
            }
            
        }
    }
    
}

