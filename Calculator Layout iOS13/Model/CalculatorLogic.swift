//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Iliyas Shakhabdin on 11.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number{
            if symbol == "+/-"{
                return n * -1
            } else if symbol == "AC"{
                return 0
            } else if symbol == "%"{
                return n/100
            } else if symbol == "+"{
                intermediateCalculation = (n1: n, calcMethod: symbol)
            } else if symbol == "="{
                return performTwoNumberCalculation(n2: n)
            } else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, 
            let operation = intermediateCalculation?.calcMethod{
            switch operation{
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "÷":
                return n1/n2
            case "×":
                return n1*n2
            default:
                fatalError("There is no such operation.")
            }
        }
        return nil
    }
}
