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
    
    @IBOutlet weak var winnerLbl: UILabel!
    
    @IBOutlet weak var player1HpLbl: UILabel!
    
    @IBOutlet weak var player2HpLbl: UILabel!
    
    
    var player1: Knight!
    var player2: Orc!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    player1 = Knight(hp: 100, attack: 15, name: "Rath3063")
    player2 = Orc(hp: 100, attack: 10, name: "Oric")
        
    }

    @IBAction func player1BtnTapped(sender: AnyObject) {
        
        
    if (player2.attackAttempt(player1.attack)){
        printLbl.text = "\(player1.name) attacked for \(player1.attack) Damage"
        player2HpLbl.text = "\(player2.hp) HP"
        player1AttackBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "makePlayer1Available", userInfo: nil, repeats: false)
        } else {
            printLbl.text = "Attack was Unsuccessful"
            
        }
        
    if (!player2.isAlive){
       winnerLbl.text = "\(player1.name) Wins!"
        player1AttackBtn.enabled = false
        player2HpLbl.hidden = true
        winnerLbl.hidden = false
        printLbl.text = ""
        restartBtn.hidden = false
            
        }
        
    }
    
   @IBAction func player2BtnTapped(sender: AnyObject) {
        
    if(player1.attackAttempt(player2.attack)) {
        printLbl.text = "\(player2.name) attacked for \(player2.attack) Damage"
        player1HpLbl.text = "\(player1.hp) HP"
        player2AttackBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "makePlayer2Available", userInfo: nil, repeats: false)
    } else {
        printLbl.text = "Attack was Unsuccessful"
    }
        
    if(!player1.isAlive) {
        player1AttackBtn.enabled = true
        player1HpLbl.hidden = true
        winnerLbl.hidden = false
        printLbl.text = ""
        winnerLbl.text = "\(player2.name) Wins!"
        restartBtn.hidden = false
        }
        
    }
    
    
    @IBAction func restartBtnTapped(sender: AnyObject) {
        
        printLbl.text = "Restarting Match"
        winnerLbl.hidden = true
        
        player1 = Knight(hp: 100, attack: 15, name: "Rath3063")
        player1HpLbl.hidden = false
        player1HpLbl.text = "\(player1.hp) HP"
        
        
        player2 = Orc(hp: 100, attack: 10, name: "Oric")
        player2HpLbl.hidden = false
        player2HpLbl.text = "\(player2.hp) HP"
        
    
        
        
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

