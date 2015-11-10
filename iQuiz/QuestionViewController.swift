//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/10/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    private let ANSWER_SEGUE = "answerSegue"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    var questions:String!
    var answers:String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = questions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Prepare answer VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == ANSWER_SEGUE {
            let answerViewController = segue.destinationViewController as! AnswerViewController
            
            answerViewController.question = questions
            answerViewController.choosenAnswer = nil
            answerViewController.correctAnswer = answers
        }
    }
}