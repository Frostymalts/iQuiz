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
    private let FINAL_SEGUE = "answerToFinalQuestionSegue"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var chosenAnswerLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questions:[Question] = []
    var chosenAnswer:String = ""
    var currentQuestionIndex = 0
    var numOfCorrectAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex].question
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
        
        self.navigationController?.navigationBarHidden = true
        
        questionLabel.text = "The question: \(question)"
        chosenAnswerLabel.text = "Your answer: \(chosenAnswer)"
        answerLabel.text = "Correct answer: \(correctAnswer)"
        
        if chosenAnswer == correctAnswer {
            self.view.backgroundColor = UIColor.greenColor()
            numOfCorrectAnswers += 1
        } else {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    // Prepare answer VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == QUESTION_SEGUE {
            let questionViewController = segue.destinationViewController as! QuestionViewController
            questionViewController.questions = questions
            questionViewController.currentQuestionIndex = currentQuestionIndex + 1  // Increment Question
            questionViewController.numOfCorrectAnswers = numOfCorrectAnswers
        } else if segue.identifier == FINAL_SEGUE {
            let finishedViewController = segue.destinationViewController as! FinishedViewController
            finishedViewController.numOfCorrectAnswers = numOfCorrectAnswers
            finishedViewController.questions = questions
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        if currentQuestionIndex == questions.count - 1
        {
            performSegueWithIdentifier(FINAL_SEGUE, sender: sender)
        } else {
            performSegueWithIdentifier(QUESTION_SEGUE, sender: sender)
        }
    }
}
