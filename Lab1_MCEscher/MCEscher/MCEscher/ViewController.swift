//
//  ViewController.swift
//  MCEscher
//
//  Created by Christina Nguyen on 9/8/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bioText: UILabel!

    @IBOutlet weak var leadImage: UIImageView!
    
    @IBAction func artButton(sender: UIButton) {
        if sender.currentTitle=="Artwork" {
            leadImage.image=UIImage(named: "Relativity.png")
            bioText.text="This is one of Escher's famous works, Relativity."
        }
        else if sender.currentTitle=="Biography" {
            leadImage.image=UIImage(named:"Reflection.png")
            bioText.text="M.C. Escher is a Dutch artist famous for math-based art."
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

