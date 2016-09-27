//
//  ViewController.swift
//  RetireMEnt
//
//  Created by Christina Nguyen on 9/26/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var startingAmount: UITextField!
    
    @IBOutlet weak var annualDeposit: UITextField!
    
    @IBOutlet weak var interest: UITextField!
    
    @IBOutlet weak var years: UITextField!
    
    @IBOutlet weak var retirementFund: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        calculateRetirement()
    }
    
    func calculateRetirement() {
        var principal : Float
        var rateOfGrowth : Float
        var yearsOfGrowth : Float
        var retirement : Float
        
        if startingAmount.text!.isEmpty {
            principal = 0.0
        } else {
            principal = Float(startingAmount.text!)!
        }
        
        if interest.text!.isEmpty {
            rateOfGrowth = 0.0
        } else {
            rateOfGrowth = (Float(interest.text!)!/100) + 1
        }
        
        if years.text!.isEmpty {
            yearsOfGrowth = 0.0
        } else {
            yearsOfGrowth = Float(years.text!)!
        }
        
        if rateOfGrowth != 0 {
            retirement = principal * powf(rateOfGrowth, yearsOfGrowth)
        } else {
            retirement = principal
        }
        
        var retirementFormat = NSNumberFormatter()
        retirementFormat.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        retirementFund.text = retirementFormat.stringFromNumber(retirement)
    }
    
    
    
    
    

    override func viewDidLoad() {
        startingAmount.delegate = self
        interest.delegate = self
        years.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        startingAmount.resignFirstResponder()
        interest.resignFirstResponder()
        years.resignFirstResponder()
    }
}

