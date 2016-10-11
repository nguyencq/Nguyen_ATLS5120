//
//  ViewController.swift
//  CreditRewards
//
//  Created by Christina Nguyen on 9/28/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var displayCard = Card()
    
    let amexBlueCash = Card(name: "American Express Blue Cash Preferred", rewards: "Cash back: 6% on US supermarkets up to $6,000 a year, 3% on US gas stations and department stores, 1% everything else", bonus: "$150 after $1,000 spent in first 3 months; 5% cash back on up to $4,000 of travel purcahses in the first 6 months", af: "$95", apr: "13.24% - 23.24%", btfee: "The greater of: $5 or 3% of transfer amount", forex: "2.7% per transaction", image: "amex.png")
    
    let amexSPG = Card(name: "American Express Starwood Preferred Guest", rewards: "5 Starpoints per dollar spent at SPG hotels, 1 Starpoint per dollar everything else", bonus: "2 free nights at an SPG hotel after $3,000 spent in first 3 months", af: "$95 (waived first year)", apr: "15.49% - 19.49%", btfee: "The greater of: $5 or 3% of transfer amount", forex: "None", image: "spg.png")
    
    let bankAmericard = Card(name: "BankAmericard Travel Rewards", rewards: "Unlimited 1.5 points per dollar", bonus: "20,000 points after $1,000 spent in first 90 days", af: "None", apr: "15.24% - 23.24%", btfee: "3% of transfer amount; minimum $10", forex: "None", image: "bankAmericard.png")
    
    let barclaycardRewards = Card(name: "Barclaycard Rewards MasterCard", rewards: "2 points per dollar on gas, utility, and grocery stores; 1 point per dollar everything else", bonus: "None", af: "None", apr: "25.24%", btfee: "The greater of: $5 or 3% of transfer amount", forex: "3% per transaction", image: "barclaycard.png")
    
    let capitalOneSecured = Card(name: "Capital One Secured MasterCard", rewards: "None", bonus: "None", af: "None, but $200 initial, refundable deposit", apr: "24.99%", btfee: "None", forex: "None", image: "capitalOneSecured")
    
    let capitalOneQuicksilver = Card(name: "Capital One QuicksilverOne", rewards: "Unlimited 1.5% cash back", bonus: "Every 10th Uber ride is free up to $15", af: "$39", apr: "23.24%", btfee: "None", forex: "None", image: "quicksilverOne.png")
    
    let chaseFreedom = Card(name: "Chase Freedom", rewards: "Cash back: 5% on up to $1,500 in combined purchases in quarterly bonus categories, 1% everything else", bonus: "$150 after $500 spent in first 3 months", af: "None", apr: "14.24% - 23.24%", btfee: "The greater of: $5 or 5% of transfer amount", forex: "3% per transaction", image: "freedom.png")
    
    let chaseSapphire = Card(name: "Chase Sapphire Preferred", rewards: "2 points per dollar on travel and dining, 1 point per dollar everything else", bonus: "50,000 points after $4,000 spent in first 3 months", af: "$95 (waived first year)", apr: "16.24% - 23.24%", btfee: "The greater of: $5 or 5% of transfer amount", forex: "None", image: "csp.png")
    
    let discoverIT = Card(name: "Discover it", rewards: "Cash back: 5% on up to $1,500 in combined purchases in quarterly bonus cateogires, 1% everything else", bonus: "Cash back match 100% of first year rewards", af: "None", apr: "11.24 - 23.24%", btfee: "3% of transfer amount", forex: "None", image: "it.png")
    
    let citiDouble = Card(name: "Citi Double Cash", rewards: "Cash back: 1% on purchases and 1% when balance is paid", bonus: "None", af: "None", apr: "13.24% - 23.24%", btfee: "The greater of: $5 or 3% of transfer amount", forex: "3%", image: "citiDouble.png")
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var categorySelector: UISegmentedControl!
    
    @IBOutlet weak var afSwitch: UISwitch!
    @IBOutlet weak var ftfSwitch: UISwitch!
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var rewardsLabel: UILabel!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var afLabel: UILabel!
    @IBOutlet weak var aprLabel: UILabel!
    @IBOutlet weak var btfeeLabel: UILabel!
    @IBOutlet weak var forexLabel: UILabel!
    
    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var rewardsDisplay: UILabel!
    @IBOutlet weak var bonusDisplay: UILabel!
    @IBOutlet weak var afDisplay: UILabel!
    @IBOutlet weak var aprDisplay: UILabel!
    @IBOutlet weak var btfeeDisplay: UILabel!
    @IBOutlet weak var forexDisplay: UILabel!
    

    
    @IBAction func annualFee(sender: UISwitch) {
        changeCard()
    }
    
    @IBAction func fiveTwentyfour(sender: UISwitch) {
        changeCard()
    }
    
    @IBAction func changeDisplay(sender: UISegmentedControl) {
        changeCard()
    }
    
    func changeCard() {
        if afSwitch.on {
            if categorySelector.selectedSegmentIndex == 0 {
                updateDisplay(barclaycardRewards)
            } else if categorySelector.selectedSegmentIndex == 1 {
                updateDisplay(citiDouble)
            } else if categorySelector.selectedSegmentIndex == 2 {
                updateDisplay(bankAmericard)
            } else if categorySelector.selectedSegmentIndex == 3 {
                if ftfSwitch.on {
                    updateDisplay(discoverIT)
                } else {
                    updateDisplay(chaseFreedom)
                }
            }
        } else {
            if categorySelector.selectedSegmentIndex == 0 {
                updateDisplay(capitalOneSecured)
            } else if categorySelector.selectedSegmentIndex == 1 {
                updateDisplay(capitalOneQuicksilver)
            } else if categorySelector.selectedSegmentIndex == 2 {
                if ftfSwitch.on {
                    updateDisplay(amexSPG)
                } else {
                    updateDisplay(chaseSapphire)
                }
            } else if categorySelector.selectedSegmentIndex == 3 {
                updateDisplay(amexBlueCash)
            }
        }
    }
    
    func updateDisplay(display: Card) {
        displayCard = display
        nameDisplay.text = displayCard.name
        rewardsDisplay.text = displayCard.rewards
        bonusDisplay.text = displayCard.bonus
        afDisplay.text = displayCard.af
        aprDisplay.text = displayCard.apr
        btfeeDisplay.text = displayCard.btfee
        forexDisplay.text = displayCard.forex
        cardImage.image = UIImage(named: displayCard.image!)
    }
    
    
    
    

    override func viewDidLoad() {
        informationLabel.layer.borderWidth = 1
        detailsLabel.layer.borderWidth = 1
        rewardsLabel.layer.borderWidth = 1
        rewardsDisplay.layer.borderWidth = 1
        bonusLabel.layer.borderWidth = 1
        bonusDisplay.layer.borderWidth = 1
        afLabel.layer.borderWidth = 1
        afDisplay.layer.borderWidth = 1
        aprLabel.layer.borderWidth = 1
        aprDisplay.layer.borderWidth = 1
        btfeeLabel.layer.borderWidth = 1
        btfeeDisplay.layer.borderWidth = 1
        forexLabel.layer.borderWidth = 1
        forexDisplay.layer.borderWidth = 1
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

