//
//  ViewController.swift
//  MyCoolNewGameProject
//
//  Created by Lo Howard on 6/12/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchState: UISwitch!
    
//    var switchInfo = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let switchBool = !switchState.isOn
            let destinationVC = segue.destination as? GameScreenViewController
            destinationVC?.isOnePlayer = switchBool
        }
    }
}
