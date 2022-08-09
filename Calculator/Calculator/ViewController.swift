//
//  ViewController.swift
//  Calculator
//
//  Created by Simran Jaikumar Lekhwani on 1/15/19.
//  Copyright © 2019 Simran Jaikumar Lekhwani. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = false
    var operation = 0
    var count = 0
    var decimalCount: Double = 10
    
    @IBOutlet weak var Label: UILabel!
    
    
    
    @IBAction func Numbers(_ sender: UIButton) {
        
        if performingMath == true {
            Label.text = String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        } else {
            if (Label.text?.contains("."))! {
                decimalPoint(sender)
            } else {
                Label.text = Label.text! + String(sender.tag-1)
                numberOnScreen = Double(Label.text!)!
            }
            
        }
        
    }
    
    
    
    func decimalPoint (_ sender: UIButton) {
        let input = Double(sender.tag)
        while input == 1 || input == 2 || input == 3 || input == 4 || input == 5 || input == 6 || input == 7 || input == 8 || input == 9 || input == 10 {
            //Label.text = (Label.text ?? "") + "\(String(describing: sender.titleLabel))"//user input
            
            if let userInput = readLine() {
                previousNumber = numberOnScreen + (Double(userInput)! / decimalCount)
                Label.text =  String(previousNumber)
            }
            
                decimalCount *= 10
            }
    
        }
        
    
    
    @IBAction func otherButtons(_ sender: UIButton) {
        
        
        if Label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 18 && sender.tag != 19 {
            
            //previousNumber = Double(Label.text!)!
            
            if sender.tag == 12 { // Divide sign
                Label.text = String(numberOnScreen) + " /"
                previousNumber = numberOnScreen
                
            } else if sender.tag == 13 { // Multiplication sign
                previousNumber = Double(Label.text!)!
                Label.text = String(numberOnScreen) + " x"
                if(count == 0 || previousNumber > 0){
                 previousNumber = numberOnScreen
                }
              count += 1
                
            } else if sender.tag == 14 { // Subtraction - minus sign
                Label.text = String(numberOnScreen) + " -"
                if(count == 0 || previousNumber < 0){
                    previousNumber = numberOnScreen - previousNumber
                } else {

                    previousNumber = previousNumber - numberOnScreen
                }
                count = count + 1
                
            } else if sender.tag == 15 { // Addition - Plus sign
                Label.text = String(numberOnScreen) + " +"
                if(count == 0 || previousNumber > 0){
                    previousNumber += numberOnScreen
                } else {
                    previousNumber = Double(Label.text!)!
                    previousNumber = previousNumber - numberOnScreen
                }
                count += 1
                
            } else if sender.tag == 17 { // Decimal point
                Label.text = String(Int(numberOnScreen)) + "."
                decimalPoint(sender) // stringtostring
            }
            
            operation = sender.tag
            performingMath = true
            
        } else if sender.tag == 16 {
            if operation == 12 {
                Label.text = String (previousNumber / numberOnScreen)
            } else if operation == 13 {
                Label.text = String (previousNumber * numberOnScreen)
            } else if operation == 14 {
                Label.text = String (previousNumber - numberOnScreen)
            } else if operation == 15 {
                Label.text = String (previousNumber + numberOnScreen)
                }
        } else if sender.tag == 18 {
            Label.text = String (numberOnScreen * (-1))
        } else if sender.tag ==  19 {
            
            Label.text = String(numberOnScreen / 100)
        } else if sender.tag == 11 {
            Label.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            count = 0
            decimalCount = 0
        }
        
        
    }

  
    
    /*@IBAction func toScientificCalculatorButton(_ sender: Any) {
      performSegue(withIdentifier: "ToScientificCalculator", sender: self)
        func prepare(for segue: UIStoryboardSegue, sender: self) {
        if (segue.identifier == "ToScientificCalculator") {
            let controller = segue.destination as! ScientificViewController
        }
        
    }
         }
*/
    
 
    
    @IBAction func ToScientificCalculator(_ sender: Any) {
            performSegue(withIdentifier: "ToScientificCalculator", sender: self)
   
    }
    
    
   
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //Get the new view controller using segue.destinationViewController.
     //Pass the selected object to the new view controller.
    
    let destVC : ScientificViewController = segue.destination as! ScientificViewController
    destVC.dataFromBasic = "\(Label.text)"  
    
 }
}
