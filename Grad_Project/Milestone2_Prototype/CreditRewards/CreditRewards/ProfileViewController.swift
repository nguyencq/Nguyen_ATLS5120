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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
