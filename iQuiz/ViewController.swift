//
//  ViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/3/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    private let settingsViewController = SettingsViewController()
    private let questionSeque = "questionSegue"
    private var keys: [String] = [String]()
    private var quizzes: [String: [Question]] = ["":[]]
    @IBOutlet weak var tableView: UITableView!
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJSON()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of mandatory rows
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return keys.count
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
            
            cell!.textLabel?.text = keys[indexPath.row]
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
    
    // Load json file from web
    private func loadJSON() {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
        
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                for quiz in json {
                    let title = quiz["title"] as! String
                    print("\(title)")
                    if title != "" {
                        let desc = quiz["desc"]
                        let questionsFromData:[NSDictionary] = quiz["questions"] as! [NSDictionary]
                        var questions = [Question]()
                        for question in questionsFromData {
                            let answer = question["answer"] as! String
                            let answers = question["answers"] as! [String]
                            let questionText = question["text"] as! String
                            let currentQuestion = Question(question: questionText, answers: answers, correctAnswer: answer)
                            questions.append(currentQuestion)
                        }
                        self.keys.append(title)
                        self.quizzes[title] = questions
                    }
                }
                self.tableView.reloadData()
            } catch {
                print("You errored out tough bruh")
            }
        }
        
        task.resume()
    }
}

