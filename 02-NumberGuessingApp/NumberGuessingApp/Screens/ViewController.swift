//
//  ViewController.swift
//  NumberGuessingApp
//
//  Created by Begüm Arıcı on 20.12.2022.
//

import UIKit



class ViewController: UIViewController {
    

    
    @IBOutlet weak var random: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var star: UILabel!
    
    var correct = 0
    var heart = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDefaultData()
    }
    
    func loadDefaultData(){
        btn.layer.cornerRadius = 6
        random.text = "?"
        star.text = "⭐️ ⭐️ ⭐️"
        heart = 3
        number.text = ""
        message.text = ""
        correct = Int(arc4random_uniform(UInt32(10)))
    }
    
    @IBAction func btn(_ sender: Any) {
        
//        print(correct)
        
        let number1 = number.text ?? ""
        
        if let n1 = Int(number1) {
            helper(number: n1)
            if correct == n1 {
                print("right answer")
                random.text = "\(correct)"
                defaultAlert(title: "⭐️ Congratulations ⭐️", message: "Good job!")
                
            } else {
                heart = heart - 1
                
                if heart < 1 {
                    random.text = "\(correct)"
                    defaultAlert(title: "GAME OVER", message: "Don't be sad, you can play again.")
                }
                heartCalculator(heart: heart)
            }
        }
        
    }
    
    func defaultAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case.default:
                    self.loadDefaultData()
                case.cancel:
                    print("cancel")
                default:
                    print("")
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func heartCalculator(heart: Int){
        
        switch heart{
        case 3:
            star.text="⭐️ ⭐️ ⭐️"
            
        case 2:
            star.text="⭐️ ⭐️"
            
        case 1:
            star.text="⭐️"
            
        default:
            star.text=""
        }
    }
    
    func helper(number: Int){
        message.text = correct > number ? "Up" :  "Down "
    }
}
