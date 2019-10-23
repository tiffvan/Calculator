//
//  ViewController.swift
//  Calculator
//
//  Created by Tiffany on 2019/09/28.
//  Copyright © 2019 Tiffany van der Merwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Store
//    UserDefaults.standard.set("Anand", forKey: "name")
    
    //Retrieve
//    UserDefaults.standard.string(forKey: "Key")
    
    //Remove
//    UserDefaults.standard.removeObject(forKey: "Key")
    
    var firstValue = true
    var subTotal: Int?
       
    enum operatorType {
        case plus
        case subtract
        case multiply
        case divide
    }
    
    var lastOperator: operatorType?
    
    var equations: [String] = []
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    @IBAction func buttonEquals(_ sender: UIButton) {
        var result: Int?
        if let finalOperator = lastOperator {
            switch(finalOperator) {
                case .plus : result = subTotal! + Int(labelDisplay.text!)!
                case .subtract : result = subTotal! - Int(labelDisplay.text!)!
                case .multiply : result = subTotal! * Int(labelDisplay.text!)!
                case .divide : if Int(labelDisplay.text!)! == 0 {
                    labelDisplay.text = "Error"
                } else {result = subTotal! / Int(labelDisplay.text!)!}
        
            }
        }
        
        if let result = result {
            labelDisplay.text = "\(result)"
            self.equations.append(String(result))
            UserDefaults.standard.set(equations, forKey: "equations")
        }
        
        subTotal = nil
        firstValue = true
    }
    
    @IBAction func buttonMultiply(_ sender: UIButton) {
        if let currentSubTotal = subTotal {
            subTotal = Int(labelDisplay.text!)! * currentSubTotal
        } else {
            subTotal = Int(labelDisplay.text!)!
        }
        lastOperator = operatorType.multiply
        firstValue = true
        labelDisplay.text = "\(subTotal!)"
    }
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        if Int(labelDisplay.text!)! == 0 {
            labelDisplay.text = "Error"
        } else {
            
        
        if let currentSubTotal = subTotal {
            subTotal = Int(labelDisplay.text!)! / currentSubTotal
            
        } else {
            subTotal = Int(labelDisplay.text!)!
        }
            
        lastOperator = operatorType.divide
        firstValue = true
        labelDisplay.text = "\(subTotal!)"
            }
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        if let currentSubTotal = subTotal {
            subTotal = Int(labelDisplay.text!)! - currentSubTotal
        } else {
            subTotal = Int(labelDisplay.text!)!
        }
        lastOperator = operatorType.subtract
        firstValue = true
        labelDisplay.text = "\(subTotal!)"
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        if let currentSubTotal = subTotal {
            subTotal = Int(labelDisplay.text!)! + currentSubTotal
        } else {
            subTotal = Int(labelDisplay.text!)!
        }
        lastOperator = operatorType.plus
        firstValue = true
        labelDisplay.text = "\(subTotal!)"
    }
    
    @IBAction func buttonZero(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "0"
        } else {
            labelDisplay.text = labelDisplay.text! + "0"
        }
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "1"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "1"
        }
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "2"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "2"
        }
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "3"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "3"
        }
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "4"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "4"
        }
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "5"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "5"
        }
    }
    
    @IBAction func buttonSix(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "6"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "6"
        }
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "7"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "7"
        }
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "8"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "8"
        }
    }
    
    @IBAction func buttonNine(_ sender: UIButton) {
        if firstValue {
            labelDisplay.text = "9"
            firstValue = false
        } else {
            labelDisplay.text = labelDisplay.text! + "9"
        }
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        labelDisplay.text = "0"
        firstValue = true
    }
    
    @IBAction func historyTap(_ sender: Any) {
        performSegue(withIdentifier: "toHistory", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDisplay.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toHistory" {
//            if let viewController = self.presentingViewController as? HistoryViewController {
//                viewController.historyItems = self.equations
//                viewController.tableView.reloadData()
//            }
//        }
    }
}

