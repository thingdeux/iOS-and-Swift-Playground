//
//  Question.swift
//  VidjoGameTrivia
//
//  Created by Josh on 1/1/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import Foundation

class Question : Equatable {
    
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var rightAnswer: Int
    
    
    
    init(question:String, answer1:String, answer2:String,
        answer3:String, answer4:String, rightAnswer: Int) {
            self.question = question
            self.answer1 = answer1
            self.answer2 = answer2
            self.answer3 = answer3
            self.answer4 = answer4
            self.rightAnswer = rightAnswer
    }
    
    static func getQuestions() -> [Question] {
        var questions: [Question] = []
        if let path = NSBundle.mainBundle().pathForResource("Prefs", ofType: "plist"),
            let prefs: Dictionary<String, AnyObject> = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                if let questionArray: [Dictionary<String, AnyObject>] = prefs["Questions"] as? [Dictionary<String, AnyObject>] {
                    for q in questionArray {
                        if let answer: Int = q["rightAnswer"] as? Int {
                            // Should probably unwrap all of these but as I don't plan to move further with this
                            // I'll get WILD! Just make sure to follow the previously set pattern when adding to prefs OR ELSE!
                            let question = Question(
                                question: q["question"] as! String,
                                answer1: q["answer1"] as! String,
                                answer2: q["answer2"] as! String,
                                answer3: q["answer3"] as! String,
                                answer4: q["answer4"] as! String,
                                rightAnswer: answer
                            )
                            questions.append(question)
                        }
                        
                    }
                }
        }
        
    
        return questions
    }
}

func ==(lhs: Question, rhs: Question) -> Bool {
    return lhs.question == rhs.question
}