//
//  ViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/3/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let questionSeque = "questionSegue"
    private let mathQuestions = [
        Question(question: "2 + 2", answers: ["4", "2", "6"], correctAnswer: "4"),
        Question(question: "5-1", answers: ["4", "3", "-2"], correctAnswer: "4"),
        Question(question: "6+0", answers: ["6", "1", "3"], correctAnswer: "6")
    ]
    private let marvelQuestions = [
        Question(question: "Superman's real name?", answers: ["Clark Kent", "Spider Man", "Frodo"], correctAnswer: "Clark Kent"),
        Question(question: "Who is a Marvel Character?", answers: ["Superman", "Your mom", "Spongebob"], correctAnswer: "Superman"),
        Question(question: "What is the name of another comic brand", answers: ["Dark Horse", "Freebird", "Your mom"], correctAnswer: "Dark Horse")
    ]
    private let scienceQuestions = [
        Question(question: "What is the powerhouse of the cell?", answers: ["Mitochondria", "Your Mom", "Conrad"], correctAnswer: "Mitochondria"),
        Question(question: "What is the act of energy through light", answers: ["Photosynthesis", "YAH YAH YAH", "Lorde"], correctAnswer: "Photosynthesis"),
        Question(question: "Are Whales mamal?", answers: ["Yes", "No", "Don't tell me nothing"], correctAnswer: "Yes")
    ]
    private var quizzes: [String: [Question]] = ["":[]]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizzes = [
            "Mathematics": mathQuestions,
            "Marvel": marvelQuestions,
            "Science": scienceQuestions
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Event handler for pressing the settings button
    // Currently displays a pop up dialog
    @IBAction func settingsPressed(sender: UIBarButtonItem) {
        let title = "Settings go here"
        let controller = UIAlertController(title: title, message: nil,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // Number of mandatory rows
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return quizzes.count
    }
    
    // Make tablecells
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
                as UITableViewCell!
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
            }
            
            let image = UIImage(named: "star")
            cell!.imageView?.image = image
            let highlightedImage = UIImage(named: "star2")
            cell!.imageView?.highlightedImage = highlightedImage
            
            cell!.textLabel?.text = Array(quizzes.keys)[indexPath.row]
            cell!.textLabel?.font = UIFont .boldSystemFontOfSize(18)
            //cell!.detailTextLabel?.text = "Hella single-origin coffee intelligentsia, plaid trust fund keffiyeh 8-bit."
            //cell.detailTextLabel?.font = UIFont.systemFontOfSize(12)
            return cell!
    }
    
    // Once we have selected a table cell
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            performSegueWithIdentifier(questionSeque, sender: cell)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == questionSeque {
            let cell = sender as! UITableViewCell
            let key = cell.textLabel?.text
            let problems = quizzes[key!]
            let questionViewController = segue.destinationViewController as! QuestionViewController
            
            questionViewController.questions = problems!
        }
    }
}

