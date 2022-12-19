//
//  ViewController.swift
//  DiceRollerApp
//
//  Created by Begüm Arıcı on 19.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var left: UIImageView!
    
    @IBOutlet weak var right: UIImageView!
    
    let items = [UIImage(named: "dice1"), UIImage(named: "dice2"),UIImage(named: "dice3"),UIImage(named: "dice4"),UIImage(named: "dice5"),UIImage(named: "dice6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn(_ sender: Any) {
        
        let first = Int(arc4random_uniform(6))
        let second = Int(arc4random_uniform(6))
              
        left.image = items[first]
        right.image = items[second]
    }
}

