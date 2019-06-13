//
//  AILogic.swift
//  MyCoolNewGameProject
//
//  Created by William Moody on 6/13/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class AILogic {
    //output random value
    var gameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5,], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    func AIMove(moveValue: Int) {
        
        //        switch moveValue {
        //        case 0:
        //            print("maybe")
        //            buttonLogic(Buttons[0])
        //        case 1:
        //            print("maybe")
        //            buttonLogic(Buttons[1])
        //        case 2:
        //            print("maybe")
        //            buttonLogic(Buttons[2])
        //        case 3:
        //            print("maybe")
        //            buttonLogic(Buttons[3])
        //        case 4:
        //            print("maybe")
        //            buttonLogic(Buttons[4])
        //        case 5:
        //            print("maybe")
        //            buttonLogic(Buttons[5])
        //        case 6:
        //            print("maybe")
        //            buttonLogic(Buttons[6])
        //        case 7:
        //            print("maybe")
        //            buttonLogic(Buttons[7])
        //        case 8:
        //            print("maybe")
        //            buttonLogic(Buttons[8])
        //        default:
        //            print("maybe not")
        //        }
    }
    
    func AIMoveLogic() {
        
        var winningDoubles: [[Int]] = []
        for combination in winningCombinations {
            
            if gameStatus[combination[0]] != 0 && gameStatus[combination[0]] == gameStatus[combination[1]] || gameStatus[combination[1]] == gameStatus[combination[2]] || gameStatus[combination[0]] == gameStatus[combination[2]] {
                winningDoubles.append(combination)
            }
        }
        if winningDoubles.isEmpty == false {
            for combination in winningDoubles {
                if gameStatus[combination[0]] == 2 || gameStatus[combination[1]] == 2 || gameStatus[combination[2]] == 2 {
                    AIMove(moveValue: combination[0])
                    AIMove(moveValue: combination[1])
                    AIMove(moveValue: combination[2])
                    return
                }
            }
            for combination in winningDoubles {
                if gameStatus[combination[0]] == 1 || gameStatus[combination[1]] == 1 || gameStatus[combination[2]] == 1 {
                    AIMove(moveValue: combination[0])
                    AIMove(moveValue: combination[1])
                    AIMove(moveValue: combination[2])
                    return
                }
            }
        } else {
            let randomNumber = Int.random(in: 0...8)
            AIMove(moveValue: randomNumber)
        }
    }
}
