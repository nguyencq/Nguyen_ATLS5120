//
//  ViewController.swift
//  TipCalculator
//
//  Created by Christina Nguyen on 9/20/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // The left-hand labels that should not change
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var perPerson: UILabel!
    
    // The right-hand labels that should vary based on input
    
    @IBOutlet weak var amountInput: UITextField!
    
    @IBOutlet weak var tipInput: UITextField!
    
    @IBOutlet weak var peopleInput: UITextField!
    
    @IBOutlet weak var tipDisplay: UILabel!
    
    @IBOutlet weak var totalDisplay: UILabel!
    
    @IBOutlet weak var totalPPDisplay: UILabel!
    
    
    var checkPreTip : Float?
    var tipPercent : Float?
    var numPeople : Int?
    var tip : Float?
    var total : Float?
    var pp : Float = 0.0
    
    //The field the user is currently in is called the "first responder" because it is responding to the user at that point.
    // resignFirstResponder resigns whatever the user is looking at.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateTipTotals() {
        if amountInput.text!.isEmpty {
            checkPreTip = 0.0
        } else {
            checkPreTip = Float(amountInput.text!)
        }
        
        if tipInput.text!.isEmpty {
            tipPercent = 0.0
        } else {
            tipPercent = Float(tipInput.text!)!/100
        }
        
        numPeople = Int(peopleInput.text!)
        tip = checkPreTip!*tipPercent!
        total = checkPreTip! + tip!
        if numPeople != nil {
            if numPeople! > 0 {
                pp = total! / Float(numPeople!)
            } else {
                // Create a UIAlertController object
                let alert = UIAlertController(title: "Warning", message: "The number of people must be greater than 0.", preferredStyle: UIAlertControllerStyle.Alert)
                // create a UIAlertAction object for the button
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:
                    {action in
                        self.peopleInput.text="1"
                        self.updateTipTotals()
                    })
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle // set the number style
        tipDisplay.text = currencyFormatter.stringFromNumber(tip!)
        totalDisplay.text = currencyFormatter.stringFromNumber(total!)
        totalPPDisplay.text = currencyFormatter.stringFromNumber(pp)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        updateTipTotals()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        amountInput.delegate = self
        tipInput.delegate = self
        peopleInput.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

