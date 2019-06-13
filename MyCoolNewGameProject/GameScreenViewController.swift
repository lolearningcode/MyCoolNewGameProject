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
    @IBOutlet weak var resetButton: UIButton!
    
    var isOnePlayer = true
    var activePlayer = 1
    var aiHasMoved = true
    var gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5,], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButtons()
        WinnerLabel.isHidden = true
        resetButton.isHidden = true
        gameReset()
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
        if isOnePlayer {
            if aiHasMoved {
                if (gameStatus[button.tag - 1] == 0 && gameIsActive == true) {
                    gameStatus[button.tag - 1] = activePlayer
                    button.setImage(UIImage(named: "O"), for: .normal)
                    aiHasMoved = false
                    activePlayer = 2
                    AIMoveLogic()
                    return
                }
            }else {
                if (gameStatus[button.tag - 1] == 0 && gameIsActive == true) {
                    gameStatus[button.tag - 1] = activePlayer
                    button.setImage(UIImage(named: "X"), for: .normal)
                    aiHasMoved = true
                    activePlayer = 1
                }
            }
        } else if (gameStatus[button.tag - 1] == 0 && gameIsActive == true) {
            gameStatus[button.tag - 1] = activePlayer 
            if (activePlayer == 1) {
                button.setImage(#imageLiteral(resourceName: "O"), for: .normal)
                activePlayer = 2
            } else {
                button.setImage(#imageLiteral(resourceName: "X"), for: .normal)
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
                    resetButton.isHidden = false
                    WinnerLabel.text = "O's Win!!!"
                    gameIsActive = false
                } else {
                    WinnerLabel.isHidden = false
                    resetButton.isHidden = false
                    WinnerLabel.text = "X's Win!!!"
                    gameIsActive = false
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
            resetButton.isHidden = false
        }
    }
    
    func gameReset() {
        WinnerLabel.isHidden = true
        resetButton.isHidden = true
        gameIsActive = true
        activePlayer = 1
        aiHasMoved = true
        gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1...9 {
            guard let button = view.viewWithTag(i) as? UIButton else { return }
            button.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    func AIMove(moveValue: Int) {
        aiHasMoved = false
        switch moveValue {
        case 0:
            print("maybe")
            buttonLogic(Buttons[0])
        case 1:
            print("maybe")
            buttonLogic(Buttons[1])
        case 2:
            print("maybe")
            buttonLogic(Buttons[2])
        case 3:
            print("maybe")
            buttonLogic(Buttons[3])
        case 4:
            print("maybe")
            buttonLogic(Buttons[4])
        case 5:
            print("maybe")
            buttonLogic(Buttons[5])
        case 6:
            print("maybe")
            buttonLogic(Buttons[6])
        case 7:
            print("maybe")
            buttonLogic(Buttons[7])
        case 8:
            print("maybe")
            buttonLogic(Buttons[8])
        default:
            print("maybe not")
        }
    }
    
    func AIMoveLogic() {
        var winningDoubles: [[Int]] = []
        for combination in winningCombinations {
            
            if gameStatus[combination[0]] != 0 && gameStatus[combination[0]] == gameStatus[combination[1]] || gameStatus[combination[1]] != 0 && gameStatus[combination[1]] == gameStatus[combination[2]] || gameStatus[combination[0]] != 0 && gameStatus[combination[0]] == gameStatus[combination[2]] {
                winningDoubles.append(combination)
            }
        }
        if winningDoubles.isEmpty == false {
            for combination in winningDoubles {
                if gameStatus[combination[0]] == 2 || gameStatus[combination[1]] == 2 || gameStatus[combination[2]] == 2 {
                    AIMove(moveValue: combination[0])
                    if aiHasMoved {
                        return
                    }
                    AIMove(moveValue: combination[1])
                    if aiHasMoved {
                        return
                    }
                    AIMove(moveValue: combination[2])
                    if aiHasMoved {
                        return
                    }
                }
            }
            for combination in winningDoubles {
                if gameStatus[combination[0]] == 1 || gameStatus[combination[1]] == 1 || gameStatus[combination[2]] == 1 {
                    AIMove(moveValue: combination[0])
                    if aiHasMoved {
                        return
                    }
                    AIMove(moveValue: combination[1])
                    if aiHasMoved {
                        return
                    }
                    AIMove(moveValue: combination[2])
                    if aiHasMoved {
                        return
                    }
                }
            }
        }
        var whileCount = 0
        while aiHasMoved == false {
            let randomNumber = Int.random(in: 0...8)
            buttonLogic(Buttons[randomNumber])
            whileCount += 1
            if whileCount > 50 {
                return
            }
        }
    }
}
