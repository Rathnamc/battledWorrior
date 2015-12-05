//
//  Character.swift
//  BattledWarrior
//
//  Created by Christopher Rathnam on 12/5/15.
//  Copyright © 2015 Christopher Rathnam. All rights reserved.
//

import Foundation

class Character {

    private var _hp: Int = 100
    private var _attack: Int = 10
    private var _name: String
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attack: Int {
        get {
            return _attack
        }
    }
    
    
    var name: String {
        get {
            return _name
        }
    }
   
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init(startHp: Int, attackPower: Int, characterName: String){
        self._hp = startHp
        self._attack = attackPower
        self._name = characterName
    }
    
    func attackAttempt(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
    
}
