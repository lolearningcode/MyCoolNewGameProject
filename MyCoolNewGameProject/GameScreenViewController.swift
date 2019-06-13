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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButtons()
        
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
        //check if cell is taken
        //swap image accordingly
        //check for winner
        //AI take their turn
        //check for winner
    }
    
}
