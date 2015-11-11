//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/10/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private let ANSWER_SEGUE = "answerSegue"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    var currentQuestionIndex = 0
    var questions:[String] = []
    var answers:[String: [String]]? = nil
    var chosenAnswer: String? = nil
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = questions[currentQuestionIndex]
        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Prepare answer VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == ANSWER_SEGUE {
            let answerViewController = segue.destinationViewController as! AnswerViewController
            answerViewController.question = questions[currentQuestionIndex]
            answerViewController.correctAnswer = answers![answerViewController.question]![0]
            answerViewController.chosenAnswer = chosenAnswer
        }
    }
    
    // How many selectors we want
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // How many options we need
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers![questions[currentQuestionIndex]]!.count
    }

    // What each row will show
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers![questions[currentQuestionIndex]]![row]
    }
    
    // What to set as our answer
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnswer = answers![questions[currentQuestionIndex]]![row]
        //answerViewController.chosenAnswer = chosenAnswer
    }
}