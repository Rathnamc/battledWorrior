//
//  ViewController.swift
//  BattledWarrior
//
//  Created by Christopher Rathnam on 12/4/15.
//  Copyright © 2015 Christopher Rathnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1AttackBtn: UIButton!
    
    @IBOutlet weak var player2AttackBtn: UIButton!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var winningLabel: UILabel!
    
    @IBOutlet weak var winnerLbl: UILabel!
    
    var player1: Knight!
    var player2: Orc!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    player1 = Knight(hp: 100, attack: 15, name: "Rath3063")
    player2 = Orc(hp: 100, attack: 10, name: "Oric")
        
    }

    @IBAction func Player1BtnTapped(sender: AnyObject) {
        
        if !player2.isAlive {
            winningLabel.text = "\(player2.name) has been killed!"
            player2AttackBtn.enabled = false
        } else if (player2.attackAttempt(player1.attack)) {
            printLbl.text = "\(player1.name) attacked for \(player1.attack) HP"
            player1AttackBtn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "makePlayer1Available", userInfo: nil, repeats: false)
        } else {
            unsuccessfulAttack()
        }
    }
    
    @IBAction func player2BtnTapped(sender: AnyObject) {
        
        if !player1.isAlive {
            winningLabel.text = "\(player1.name) has been killed!"
            player1AttackBtn.enabled = false
        } else if(player1.attackAttempt(player2.attack)) {
            printLbl.text = "\(player2.name) attacked for \(player2.attack) HP"
            player2AttackBtn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "makePlayer2Available", userInfo: nil, repeats: false)
        } else{
            unsuccessfulAttack()
        }
        
    }
    
    
    func makePlayer1Available(){
        player1AttackBtn.enabled = true
    }
    
    func makePlayer2Available(){
        player2AttackBtn.enabled = true
    }
    
    func unsuccessfulAttack(){
        printLbl.text = "Unsuccessful Attack!"
    }


}

