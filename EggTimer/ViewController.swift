//
//  ViewController.swift
//  EggTimer
//
//  Created by Shantanu on 02/03/21.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    //    let softTime = 5
    //    let mediumTime = 7
    //    let hardTime = 12
    //    MARK:- OUTLET OF PROGRESS BAR
    @IBOutlet weak var progressBar: UIProgressView!
    
    //    MARK:- OUTLET OF TITLE-LABEL
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft" : 3, "Medium" : 5, "Hard" : 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!

//    MARK:- BUTTON or EGG TAPPED FUNCTION
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print(sender.currentTitle!)
        // re-start the timer after a single-unique btn tapped.
        timer.invalidate()
        // store the title of tapped-btn in hardness.
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        // pass the key through hardness to dictionary-eggTimes & store it in secondsRemaining.
        // ex -> secondsRemaining = 300
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        // print msg of updateTimer() ,after every ti = 1.0s.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        default:
//            print(hardTime)
//        }
    }
    //    MARK:- TIMER FUNCTION
    // This fn is call in selector when btn or, egg is tapped.
    // @objc because of objective-C
   @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
//            let percentProgress = secondPassed / totalTime
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            print(Float(secondPassed) / Float(totalTime))
//            print(Float(secondPassed / totalTime))
//            print("\(secondsRemaining) seconds.")
        }else{
            timer.invalidate()
            // change the titleLabel as "Done" when timer stop.
            titleLabel.text = "Done!"
            playSound()     // call the sound fn.
        }
    }
//    MARK:- SOUND FUNCTION
    // for sound after Done!
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
