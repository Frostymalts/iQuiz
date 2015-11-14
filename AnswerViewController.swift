//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/10/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit


class AnswerViewController: UIViewController {
    private let QUESTION_SEGUE = "answerToQuestionSegue"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var chosenAnswerLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questions:[Question] = []
    var chosenAnswer:String = ""
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex].question
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
        
        questionLabel.text = "The question: \(question)"
        chosenAnswerLabel.text = "Your answer: \(chosenAnswer)"
        answerLabel.text = "Correct answer: \(correctAnswer)"
        
        if chosenAnswer == correctAnswer {
            self.view.backgroundColor = UIColor.greenColor()
        } else {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    // Prepare answer VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == QUESTION_SEGUE {
            let questionViewController = segue.destinationViewController as! QuestionViewController
            questionViewController.questions = questions
            questionViewController.currentQuestionIndex = currentQuestionIndex + 1  // Increment Question
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
