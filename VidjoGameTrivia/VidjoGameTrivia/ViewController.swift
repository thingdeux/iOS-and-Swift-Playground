//
//  ViewController.swift
//  VidjoGameTrivia
//
//  Created by Josh on 1/1/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions: [Question] = Question.getQuestions()
    var activeQuestion: Question? = nil

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBAction func answerButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("DisplayAnswer", sender: sender)
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        if let question = activeQuestion {
            if let questionIndex: Int? = questions.indexOf(question) {
                var i = questionIndex!
                if i >= questions.count - 1 {
                    i = -1
                }
                
                if let x: Question = questions[i + 1] {
                    activeQuestion = x
                  bindQuestion(x)
                }
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.destinationViewController as? AnswerViewController != nil else {
            return
        }
        
        let answerViewController = segue.destinationViewController as! AnswerViewController
        let selectedAnswer = sender as! UIButton
        answerViewController.question = activeQuestion
        answerViewController.guessedAnswer = selectedAnswer.tag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTwitch()
        // Do any additional setup after loading the view, typically from a nib.
        if let firstQuestion = questions.getRandomElement() {
            bindQuestion(firstQuestion)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func bindQuestion(question: Question) {
        questionLabel.text = question.question
        answerButton1.setTitle(question.answer1, forState: .Normal)
        answerButton2.setTitle(question.answer2, forState: .Normal)
        answerButton3.setTitle(question.answer3, forState: .Normal)
        answerButton4.setTitle(question.answer4, forState: .Normal)
        activeQuestion = question
    }


}

