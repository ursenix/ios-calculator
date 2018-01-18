//
//  ViewController.swift
//  ios-calculator
//
//  Created by Senthil Kumaran on 06/01/18.
//  Copyright © 2018 Senthil Kumaran. All rights reserved.
//

import UIKit

enum Operator {
    case None
    case Add
    case Minus
    case Divide
    case Multiply
}

class ViewController: UIViewController {

    var finalOutput: Double = 0
    var inCalculation: Bool = false
    var currentValue: Double = 0
    var previousValue: Double = 0
    var selectedOperator = Operator.None
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        outputLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberAction(_ sender: UIButton) {
        let val = sender.tag
        outputLabel.text! += String(val)
        currentValue = Double(outputLabel.text!)!
        
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        //let value = outputLabel.text == nil ? 0 : Double(outputLabel.text!)
        
        
        
        switch sender.tag {
        case 15:
            outputLabel.text = ""
            finalOutput = 0
        case 10: // Division
            inCalculation = true
            selectedOperator = .Divide
            //finalOutput /= value!
            setOutputLabel(value: finalOutput)
        case 11: // Add
            inCalculation = true
            selectedOperator = .Add
            
            finalOutput = previousValue + currentValue
            
            setOutputLabel(value: finalOutput)
        case 12: // Minus
            inCalculation = true
            selectedOperator = .Minus
            
            setOutputLabel(value: finalOutput)
        case 13: // Multiply
            inCalculation = true
            selectedOperator = .Multiply
            
            setOutputLabel(value: finalOutput)
        default:
            break
        }
        
        previousValue = currentValue
    }
    
    func setOutputLabel(value: Double){
        outputLabel.text = String(value)
    }
    
}

