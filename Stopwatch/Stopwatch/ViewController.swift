//
//  ViewController.swift
//  Stopwatch
//
//  Created by temirkhan on 03.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var seconds = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startTimer(_ sender: UIButton) {
            if isTimerRunning == false {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                isTimerRunning = true
                startButton.isEnabled = false
            }
        }

        @objc func updateTimer() {
            seconds += 1
            let hours = seconds / 3600
            let minutes = (seconds % 3600) / 60
            let seconds = (seconds % 3600) % 60
            timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    @IBAction func stopTimer(_ sender: UIButton) {
            timer.invalidate()
            isTimerRunning = false
            startButton.isEnabled = true
        }

        @IBAction func resetTimer(_ sender: UIButton) {
            resetTimer()
        }

        func resetTimer() {
            timer.invalidate()
            isTimerRunning = false
            seconds = 0
            timerLabel.text = "00:00:00"
            startButton.isEnabled = true
        }
    }


