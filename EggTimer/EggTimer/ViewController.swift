//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes = ["Soft": 180, "Medium": 420, "Hard": 720]
    
    var player : AVAudioPlayer!
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        label.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
            
        } else {
            timer.invalidate()
            label.text = "Done!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
}
