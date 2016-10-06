//
//  ViewController.swift
//  gestures
//
//  Created by Christina Nguyen on 10/6/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var audioPlayer : AVAudioPlayer?
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        //sender is a parameter and it's a local variable in our function
        // We can add things to call gesture when we recognize it
        let translation = sender.translationInView(view) // returns the new view and coordinates
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        // update the center of the view to where the gesture it
        sender.setTranslation(CGPointZero, inView: view) // set the translation back to 0
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale) //The transform specifies the transform and the scale factor
        // AffineTransform creates an Affine Matrix. it assigns it to the image transform property
        sender.scale = 1 //resets scale
    }
    
    @IBAction func handleRotation(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        //This is all in radians
        sender.rotation = 0
    }
    
    @IBAction func handleLongPress(sender: UILongPressGestureRecognizer) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("Canon_In_D", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        audioPlayer = try? AVAudioPlayer(contentsOfURL: fileURL)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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

