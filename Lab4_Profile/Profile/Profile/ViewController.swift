//
//  ViewController.swift
//  Profile
//
//  Created by Christina Nguyen on 10/5/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var displayAge: UILabel!
    @IBOutlet weak var displayLocation: UILabel!
    
    var user = UserData()
    
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        displayName.text = user.name
        displayAge.text = user.age
        displayLocation.text = user.location
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

