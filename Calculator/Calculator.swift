//
//  Calculator.swift
//  Calculator
//
//  Created by ereztavor on 5/25/16.
//  Copyright © 2016 ereztavor. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    
    @IBOutlet weak var smallScreen: UILabel!
    @IBOutlet weak var screen: UILabel!
    
    var numberOne = "0"
    var numberTwo = "0"
    var mathSign = ""
    var result: Float!
    var resultTwo: Float!
    var resultOnScreen = false
        
    @IBAction func clearScreen(sender: UIButton) {
        
        screen.text = "0"
        smallScreen.text = "0"
        numberOne = "0"
        numberTwo = "0"
        resultTwo = 0
        resultOnScreen = false
    }
    
    @IBAction func makeResult(sender: UIButton) {
        numberTwo = screen.text!
        
        switch mathSign {
        case "+":
            result = adding(numberOne, numTwo: numberTwo)
            screen.text = String(result)
            smallScreen.text = smallScreen.text! + " = " + String(result)
        case "-":
            result = subtracting(numberOne, numTwo: numberTwo)
            screen.text = String(result)
            smallScreen.text = smallScreen.text! + " = " + String(result)
        case "*":
            result = multiplying(numberOne, numTwo: numberTwo)
            screen.text = String(result)
            smallScreen.text = smallScreen.text! + " = " + String(result)
        case "/":
            result = dividing(numberOne, numTwo: numberTwo)
            let divResult = Float((1000 * result)/1000)
            screen.text = String(divResult)
            smallScreen.text = smallScreen.text! + " = " + String(divResult)
        case "mod":
            result = modOper(numberOne, numTwo: numberTwo)
            let divResult = Float((1000 * result)/1000)
            screen.text = String(divResult)
            smallScreen.text = smallScreen.text! + " = " + String(divResult)
        case "x^2":
            result = powerOf(numberOne)
            screen.text = String(result)
            smallScreen.text = smallScreen.text! + " = " + String(result)
        case "sqrt":
            result = sqrtOf(numberOne)
            screen.text = String(result)
            smallScreen.text = smallScreen.text! + " = " + String(result)
        default:
            print("unknown operator")
        }
        resultOnScreen = true
       
    }
    
    @IBAction func mathButton(sender: UIButton) {

        
        
        if resultOnScreen == true{
            numberOne = String(result)
            smallScreen.text = String(result) + " "
            resultOnScreen = false
        }
        
        
        numberOne = screen.text!
        mathSign = sender.currentTitle!
        screen.text = mathSign
        //smallScreen.text = mathSign
        
        smallScreen.text = smallScreen.text! + mathSign

    
    }

    @IBAction func pressDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if resultOnScreen
        {
            screen.text = digit
            resultTwo = result
            result = Float(numberOne)
            
        }
        else{
            if screen.text == "0"{
                screen.text = digit
                smallScreen.text = digit  + " "
            }
            else if screen.text == "+" || screen.text == "-" || screen.text == "/" || screen.text == "mod" || screen.text == "*"
            {
                screen.text = digit
                smallScreen.text = smallScreen.text! + " " + digit
            }
            else{
                screen.text = screen.text! + digit
                smallScreen.text = smallScreen.text! + " " + digit
            }
        }
        
        
    }
    

    func adding(numOne: String, numTwo: String) -> Float {
        let firstNum = Float(numOne)!
        let secondNum = Float(numTwo)!
        
        return firstNum + secondNum
    }
    
    func subtracting(numOne: String, numTwo: String) -> Float {
        let firstNum = Float(numOne)!
        let secondNum = Float(numTwo)!
        
        return firstNum - secondNum
    }
    
    func multiplying(numOne: String, numTwo: String) -> Float {
        let firstNum = Float(numOne)!
        let secondNum = Float(numTwo)!
        
        return firstNum * secondNum
    }
    
    func dividing(numOne: String, numTwo: String) -> Float {
        let firstNum = Float(numOne)!
        let secondNum = Float(numTwo)!
        
        return firstNum / secondNum
    }
    
    func modOper(numOne: String, numTwo: String) -> Float {
        let firstNum = Float(numOne)!
        let secondNum = Float(numTwo)!
        
        return firstNum % secondNum
    }
    
    func powerOf(numOne: String) -> Float {
        let firstNum = Float(numOne)!
        return firstNum * firstNum
    }
    
    func sqrtOf(numOne: String) -> Float {
        let firstNum = Float(numOne)!
        return sqrtf(firstNum)
    }

}
