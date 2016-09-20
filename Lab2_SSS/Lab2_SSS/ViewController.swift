//
//  ViewController.swift
//  Lab2_SSS
//
//  Created by Christina Nguyen on 9/19/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var capLabel: UILabel!
    
    @IBOutlet weak var imageDescription: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var fontSwitch: UISwitch!
    
    @IBOutlet weak var fontSize: UILabel!
    
    func maintainCaps() {
        if fontSwitch.on {
            imageDescription.text=imageDescription.text?.uppercaseString
            imageDescription.textColor=UIColor.redColor()
        }
        else {
            imageDescription.text=imageDescription.text?.lowercaseString
            imageDescription.textColor=UIColor.greenColor()
        }
    }
    
    @IBAction func changeInfo(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex == 0 {
            imageDescription.text="Daruma"
            storeImage.image=UIImage(named: "Daruma")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            imageDescription.text="Small grocer in Milan"
            storeImage.image=UIImage(named: "Milan")
        }
        maintainCaps()
    }
    
    @IBAction func capSwitch(sender: UISwitch) {
        maintainCaps()
    }
    
    
    @IBAction func changeFontSize(sender: UISlider) {
        let size=sender.value
        fontSize.text=String(format: "%.0f", size)
        let sizeCGFloat=CGFloat(size)
        imageDescription.font = UIFont.systemFontOfSize(sizeCGFloat)
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

