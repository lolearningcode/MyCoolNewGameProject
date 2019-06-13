//
//  GameScreenViewController.swift
//  MyCoolNewGameProject
//
//  Created by William Moody on 6/12/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var WinnerLabel: UILabel!
    
    var activePlayer = 1
    var gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5,], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButtons()
        WinnerLabel.isHidden = true
    }
    
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        gameReset()
    }
    
    func activateButtons() {
        Buttons.forEach{$0.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)}
        for button in Buttons {
            button.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    @objc func buttonTapped(sender: UIButton) {
        print("tapped")
        buttonLogic(sender)
    }
    
    func buttonLogic(_ button: UIButton) {
        if (gameStatus[button.tag - 1] == 0 && gameIsActive == true) {
            gameStatus[button.tag - 1] = activePlayer 
            if (activePlayer == 1) {
                button.setImage(#imageLiteral(resourceName: "X"), for: .normal)
                activePlayer = 2
            } else {
                button.setImage(#imageLiteral(resourceName: "O"), for: .normal)
                activePlayer = 1
            }
        }
        whoWinsLogic()
    }
    
    func whoWinsLogic() {
        for combination in winningCombinations {
            if gameStatus[combination[0]] != 0 && gameStatus[combination[0]] == gameStatus[combination[1]] && gameStatus[combination[1]] == gameStatus[combination[2]] {
                
                gameIsActive = false
                
                if gameStatus[combination[0]] == 1 {
                    WinnerLabel.isHidden = false
                    WinnerLabel.text = "X's Win!!!"
                } else {
                    WinnerLabel.isHidden = false
                    WinnerLabel.text = "O's Win!!!"
                }
            }
        }
        drawGame()
    }
    
    func drawGame() {
        gameIsActive = false
        
        for i in gameStatus {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            WinnerLabel.text = "It's A Draw"
            WinnerLabel.isHidden = false
        }
    }
    
    func gameReset() {
        WinnerLabel.isHidden = true
        gameIsActive = true
        activePlayer = 1
        
        for i in 1...9 {
            guard let button = view.viewWithTag(i) as? UIButton else { return }
            button.setImage(UIImage(named: ""), for: .normal)
        }
    }
}
