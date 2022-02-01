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
    
    let aggTime = ["Soft": 3 , "Medium": 7, "Hard": 10]
    var timer = Timer()
    var totalTime = 0
    var secondsRemaining = 0
    var player: AVAudioPlayer?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBAction func hardnesSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardnes = sender.currentTitle!
        totalTime = aggTime[hardnes]!
        progressBar.progress = 0
        secondsRemaining = 0
        titleLabel.text = hardnes
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsRemaining < totalTime {
            secondsRemaining += 1
            let persantageProgress = Float(secondsRemaining) / Float(totalTime)
            
            progressBar.progress = persantageProgress
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
 }
    
}
