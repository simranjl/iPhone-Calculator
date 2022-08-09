//
//  ScientificViewController.swift
//  Calculator
//
//  Created by Simran Jaikumar Lekhwani on 5/27/19.
//  Copyright © 2019 Simran Jaikumar Lekhwani. All rights reserved.
//

import UIKit

class ScientificViewController: UIViewController {
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = false
    var operation = 0
    var count = 0
    var decimalCount: Double = 10
    
    @IBAction func BackToBasicCalc(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var DisplayLabel: UILabel!
    
    var dataFromBasic: String = ""
    
    
    @IBAction func Numbers(_ sender: UIButton) {
        
    }
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayLabel.text = dataFromBasic 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
