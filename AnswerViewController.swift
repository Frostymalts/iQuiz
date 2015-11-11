//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/10/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
   
    
    var question:String!
    var chosenAnswer:String?
    var correctAnswer:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = "The question: \(question)"
        answerLabel.text = "Correct Answer: \(correctAnswer!)"
        
        if chosenAnswer == correctAnswer {
            self.view.backgroundColor = UIColor.greenColor()
        } else {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
