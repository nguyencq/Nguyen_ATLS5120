//
//  ViewController.swift
//  Workout
//
//  Created by Christina Nguyen on 10/13/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var distance: Float?
    var calsRate: Float?
    var image: String?
    var workoutsPer : Float = 0.0
    
    @IBOutlet weak var timeSpent: UITextField!
    @IBOutlet weak var workoutType: UISegmentedControl!
    @IBOutlet weak var weeklySwitch: UISwitch!
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var workoutsPerWeek: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var numWorkouts: UISlider!
    
    
    @IBAction func changeWeekly(sender: UISwitch) {
        if weeklySwitch.on {
            numWorkouts.enabled = true
            workoutsPerWeek.text = String(workoutsPer)
        } else {
            numWorkouts.enabled = false
            workoutsPerWeek.text = ""
        }
        calculateWorkout()
    }
    @IBAction func changeNumWorkouts(sender: UISlider) {
        workoutsPer = sender.value
        workoutsPerWeek.text = String(workoutsPer)
        calculateWorkout()
    }
    @IBAction func changeWorkout(sender: UISegmentedControl) {
        calculateWorkout()
    }
    @IBAction func calculate(sender: UIButton) {
        calculateWorkout()
    }
    
    func calculateWorkout() {
        var time : Float
        
        if timeSpent.text!.isEmpty {
            time = 0.0
            miles.text = "0.0"
            calories.text = "0.0"
        } else {
            time = Float(timeSpent.text!)!
            defineDistance()
        
            if weeklySwitch.on {
                let workoutsPer = numWorkouts.value
                let milesCovered = Float((round(100*(time*distance!))/100) * workoutsPer)
                let caloriesBurned = time * calsRate! * workoutsPer
                miles.text = String(milesCovered) + " miles"
                calories.text = String (caloriesBurned) + " calories"
                workoutImage.image = UIImage(named: image!)
            } else {
                let milesCovered = Float(round(100*(time*distance!))/100)
                let caloriesBurned = time*calsRate!
                miles.text = String(milesCovered) + " miles"
                calories.text = String(caloriesBurned) + " calories"
                workoutImage.image=UIImage(named: image!)
            }
        }
        
        if time < 30 {
            let alert = UIAlertController(title: "Alert", message: "Your workout is less than 30 minutes. It is advised to workout for at least 30 minutes!", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissAction = UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(dismissAction)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func defineDistance() {
        if workoutType.selectedSegmentIndex == 0 {
            distance = 0.1
            calsRate = 10
            image = "Run"
        } else if workoutType.selectedSegmentIndex == 1 {
            distance = 0.25
            calsRate = 8.5
            image = "Bike"
        } else if workoutType.selectedSegmentIndex == 2 {
            distance = 1/30
            calsRate = 7
            image = "Swim"
        }
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        timeSpent.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

