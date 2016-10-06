//
//  InputViewController.swift
//  Profile
//
//  Created by Christina Nguyen on 10/5/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userAge: UITextField!
    @IBOutlet weak var userLocation: UITextField!
    

 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneEdit" {
            let homePage = segue.destinationViewController as! ViewController
            if userName.text!.isEmpty == false {
                homePage.user.name = userName.text
            }
            if userAge.text!.isEmpty == false {
                homePage.user.age = userAge.text!
            }
            if userLocation.text!.isEmpty == false {
                homePage.user.location = userLocation.text!
            }
        }
    }
    

    override func viewDidLoad() {
        userName.delegate = self
        userAge.delegate = self
        userLocation.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
