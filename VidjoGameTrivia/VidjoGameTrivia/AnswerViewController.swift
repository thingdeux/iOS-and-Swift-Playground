//
//  AnswerViewController.swift
//  VidjoGameTrivia
//
//  Created by Josh on 1/1/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var question: Question?
    var guessedAnswer: Int?

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if guessedAnswer == question!.rightAnswer {
            statusLabel.text = "Correct!"
        } else {
            statusLabel.text = "Incorrect!"
        }
        if question?.rightAnswer == 1 {
            correctAnswerLabel.text = "Right answer: \(question!.answer1)"
        }
        if question?.rightAnswer == 2 {
            correctAnswerLabel.text = "Right answer: \(question!.answer2)"
        }
        if question?.rightAnswer == 3 {
            correctAnswerLabel.text = "Right answer: \(question!.answer3)"
        }
        if question?.rightAnswer == 4 {
            correctAnswerLabel.text = "Right answer: \(question!.answer4)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
