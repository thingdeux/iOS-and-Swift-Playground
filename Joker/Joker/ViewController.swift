//
//  ViewController.swift
//  Joker
//
//  Created by Josh on 1/1/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var jokeList: Jokes = Jokes()
    var displayedJoke: Int = 0
    
    @IBOutlet weak var JokeTextView: UITextView!
    
    
    @IBAction func jokeChange(sender: UIButton) {
        if displayedJoke < jokeList.jokes.count - 1 {
            assignJokeToTextView(jokeList.jokes[displayedJoke + 1])
        } else {
            displayedJoke = 0
            assignJokeToTextView(jokeList.jokes[displayedJoke])
        }
    }
    
    func assignJokeToTextView(joke: String) {
        JokeTextView.text = joke
        if let jokeIndex = jokeList.jokes.indexOf(joke) {
            displayedJoke = jokeIndex
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        jokeList.jokes = jokeList.generate_chuck_norris_jokes()
        // Pick a random starting joke
        if let chosenJoke = jokeList.jokes.getRandomElement() {
            assignJokeToTextView(chosenJoke)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

