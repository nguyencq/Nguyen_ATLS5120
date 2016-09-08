//
//  ViewController.swift
//  beatles
//
//  Created by Christina Nguyen on 9/8/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var beatlesImage: UIImageView!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBAction func updateFont(sender: UISwitch) {
        if capitalSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        } else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    @IBAction func changeDisplay(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Younger Beatles"
            beatlesImage.image=UIImage(named:"Beatles1")
        } else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Not so young Beatles"
            beatlesImage.image=UIImage(named: "Beatles2")
        }
    }
    
    @IBAction func fontSize(sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize)     //convert float to string
        let fontSizeCGFloat=CGFloat(fontSize)   //convert float to CGFloat in order to pass that to the UI font system size
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)    //Create a UIFont object and assign to the font propery
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

