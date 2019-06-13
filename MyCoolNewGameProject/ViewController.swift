//
//  ViewController.swift
//  MyCoolNewGameProject
//
//  Created by Lo Howard on 6/12/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var activePlayer = 1
    var gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5,], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func squareButtonPressed(_ sender: UIButton) {
        if (gameStatus[sender.tag - 1] == 0 && gameIsActive == true) {
            gameStatus[sender.tag - 1] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "Ooo.png"), for: .normal)
                activePlayer = 1
            }
        }
        winningLoop()
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        playerWinsLabel.text = ""
        gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        playerWinsLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    func winningLoop() {
        for combination in winningCombinations {
            
            if gameStatus[combination[0]] != 0 && gameStatus[combination[0]] == gameStatus[combination[1]] && gameStatus[combination[1]] == gameStatus[combination[2]] {
                
                gameIsActive = false
                
                if gameStatus[combination[0]] == 1 {
                    playerWinsLabel.isHidden = false
                    playerWinsLabel.text = "X's Win!!!"
                    playAgainButton.isHidden = false
                } else {
                    playerWinsLabel.isHidden = false
                    playerWinsLabel.text = "O's Win!!!"
                    playAgainButton.isHidden = false
                }
            }
            
            gameIsActive = false
            
            for i in gameStatus {
                if i == 0 {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false {
                playerWinsLabel.text = "It's A Draw"
                playerWinsLabel.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
}
