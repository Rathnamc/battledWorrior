//
//  Player1.swift
//  BattledWarrior
//
//  Created by Christopher Rathnam on 12/5/15.
//  Copyright © 2015 Christopher Rathnam. All rights reserved.
//

import Foundation

class Knight: Character {
    
    override var name: String {
        return "Knight"
    }
    
    convenience init(hp: Int, attack: Int, name: String) {
        self.init(startHp: hp, attackPower: attack, characterName: name)
    }
}