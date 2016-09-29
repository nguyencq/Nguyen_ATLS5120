//
//  ViewController.swift
//  CreditRewards
//
//  Created by Christina Nguyen on 9/28/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var af = false
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var categorySelector: UISegmentedControl!
    
    @IBOutlet weak var afSwitch: UISwitch!
    @IBOutlet weak var ftfSwitch: UISwitch!
    
    
    @IBAction func annualFee(sender: UISwitch) {
        if afSwitch.on {
            
        } else {
            
        }
    }
    
    @IBAction func fiveTwentyfour(sender: UISwitch) {
        if ftfSwitch.on {
            
        } else {
            
        }
    }
    
    @IBAction func changeDisplay(sender: UISegmentedControl) {
        if categorySelector.selectedSegmentIndex == 0 {
            
        } else if categorySelector.selectedSegmentIndex == 1 {
            
        } else if categorySelector.selectedSegmentIndex == 2 {
            
        } else if categorySelector.selectedSegmentIndex == 3 {
            
        }
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

