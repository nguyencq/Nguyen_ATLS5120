//
//  ProfileViewController.swift
//  CreditRewards
//
//  Created by Christina Nguyen on 10/23/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numCards: UITextField!
    
    @IBOutlet weak var creditScore: UILabel!
    @IBOutlet weak var creditSlider: UISlider!
    
    @IBOutlet weak var ftfSwitch: UISwitch!
    @IBOutlet weak var afSwitch: UISwitch!
    @IBOutlet weak var btSwitch: UISwitch!
    @IBOutlet weak var forexSwitch: UISwitch!
    @IBOutlet weak var categorySelector: UISegmentedControl!
    
    
    @IBAction func changeScore(sender: UISlider) {
        creditScore.text = String(format: "%.0f", creditSlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        numCards.delegate = self
        creditScore.text = String(format: "%.0f", creditSlider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        numCards.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let num: Int? = Int(textField.text!)
        if num > 5 {
            ftfSwitch.enabled = true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneEditing" {
            let home = segue.destinationViewController as! ViewController
            home.userProfile.score = Int(creditSlider.value)
            home.userProfile.cards = Int(numCards.text!)
            home.userProfile.af = afSwitch.on
            home.userProfile.balanceXfer = btSwitch.on
            home.userProfile.forex = !forexSwitch.on
            home.userProfile.rewardT = categorySelector.selectedSegmentIndex
            if ftfSwitch.enabled {
                home.userProfile.ftf = ftfSwitch.on
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
