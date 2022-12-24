//
//  ViewController.swift
//  Stopwatch
//
//  Created by Begüm Arıcı on 24.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    
    var timer = Timer()
    var myTime : Float = 0.0
    var sign : Bool = true
    var firstTap : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBtn.setTitle("Play", for: .normal)
        pauseBtn.setTitle("Pause", for: .normal)
        stopBtn.setTitle("Stop", for: .normal)
    }
    
    
    @IBAction func playBtnTapAction(_ sender: Any) {
        if (sign == false) {
            sign = true
            
        } else if (firstTap == false) {
            Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countFunc), userInfo: nil, repeats: true)
            firstTap = true
            
        }
        
    }
    
    @objc func countFunc(){
        if (sign == false){
            timer.invalidate()
        } else {
            myTime = myTime + 0.01
            
            timeLabel.text = String(format: "%.2f", myTime)
        }
    }
    
    
    @IBAction func pauseBtnTapAction(_ sender: Any) {
        sign = false
    }
    

    @IBAction func stopBtnTapAction(_ sender: Any) {
        sign = false
        timer.invalidate()
        myTime = 0.0
        firstTap = true
        timeLabel.text = String(format: "%.2f", myTime)
    }
}

