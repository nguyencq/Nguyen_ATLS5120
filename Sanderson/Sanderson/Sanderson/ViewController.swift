//
//  ViewController.swift
//  Sanderson
//
//  Created by Christina Nguyen on 8/30/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var sandersonPhoto: UIImageView!
    
    @IBAction func chooseGhosting(sender: UIButton) {
        if sender.currentTitle=="Ghost Writer" {
            sandersonPhoto.image=UIImage(named: "WheelOfTime")
        } else if sender.currentTitle=="Author" { sandersonPhoto.image=UIImage(named: "Kaladin")
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

