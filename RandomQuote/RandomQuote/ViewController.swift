//
//  ViewController.swift
//  RandomQuote
//
//  Created by temirkhan on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotes: UILabel!
    
    let lyrics = ["Now, I hope that we laugh a lot, It’s going to be okay because the me of today is okay", "Please don’t say “respect” so easily" , "Someday, when these cheers die down, stay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func clickbutton(_ sender: UIButton) {
        
        let rand = Int.random(in:0...(lyrics.count-1))
        quotes.text = lyrics[rand]
    }
}

 
