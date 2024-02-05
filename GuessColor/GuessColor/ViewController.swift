//
//  ViewController.swift
//  GuessColor
//
//  Created by temirkhan on 29.10.2023.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var generateButton: UIButton!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var storeColors: [UIColor] = []
    var colorNames: [String] = []
    var score = 0 {
        didSet{ // didSet is the property observer: observes the changes in the value of property
            scoreLabel.text = "score: \(score)"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        thegame()
    }
    
    func thegame() {
        
        generateColorOptions()
        generateColor()
        
        generateButton.addTarget(self, action: #selector(generateColor), for: .touchUpInside)
        
        answerButton1.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerButton2.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
    }

    func generateColorOptions() {
        storeColors = [
            UIColor.red,
            UIColor.blue,
            UIColor.green,
            UIColor.white,
            UIColor.black,
            UIColor.orange,
            UIColor.purple,
            UIColor.brown,
            UIColor.cyan,
            UIColor.systemPink,
        ]
        colorNames = ["red", "blue", "green", "white", "black", "orange", "purple","brown", "cyan", "pink"]
    }
    
    
    @objc func generateColor() {
        let randomIndex = Int.random(in: 0..<storeColors.count);
        let selectedColor = storeColors[randomIndex]
        colorView.backgroundColor = selectedColor
        
           let index1 = randomIndex
           var index2 = randomIndex
           while index2 == index1 {
               index2 = Int.random(in: 0..<storeColors.count)
           }
        

        let correctButtonIndex = Int(arc4random_uniform(2))
                if correctButtonIndex == 0 {
                    answerButton1.backgroundColor = selectedColor
                    answerButton1.setTitle(colorNames[randomIndex], for: .normal)
                    
                    answerButton2.backgroundColor = generateRandomIncorrectColor(excluding: selectedColor)
                } else {
                    answerButton1.backgroundColor = generateRandomIncorrectColor(excluding: selectedColor)
                    answerButton2.backgroundColor = selectedColor
                    answerButton2.setTitle(colorNames[randomIndex], for: .normal)
                               
                }
    }
    func generateRandomIncorrectColor(excluding color: UIColor) -> UIColor {
        var randomColor: UIColor
        repeat {
            randomColor = storeColors.randomElement()!
        } while randomColor == color
        return randomColor
    }
    
    @objc func checkAnswer(_ sender: UIButton) {
        if sender.backgroundColor == colorView.backgroundColor {
            score+=1
        }
        generateColor()
    }
}


