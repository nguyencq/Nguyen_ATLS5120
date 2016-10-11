//
//  Card.swift
//  CreditRewards
//
//  Created by Christina Nguyen on 10/9/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//

import Foundation

class Card {
    
    init(name: String = "", rewards: String = "", bonus: String = "", af: String = "", apr: String = "", btfee: String = "", forex: String = "", image: String = "generic.png") {
        self.name = name
        self.rewards = rewards
        self.bonus = bonus
        self.af = af
        self.apr = apr
        self.btfee = btfee
        self.forex = forex
        self.image = image
    }
    
    var name: String?
    var rewards : String?
    var bonus : String?
    var af : String?
    var apr : String?
    var btfee : String?
    var forex : String?
    var image : String?
}