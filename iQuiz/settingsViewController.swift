//
//  settingsViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/14/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView.hidden = true
        connectionStatusLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkURL(sender: UIButton) {
        activityView.hidden = false
        activityView.startAnimating()
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
        
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        var quizzes = [AnyObject]()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                dispatch_async(dispatch_get_main_queue()) {
                    if quizzes.count == 0 {
                        self.connectionStatusLabel.text = "No Connection"
                    } else {
                        self.connectionStatusLabel.text = "Successful Connection"
                    }
                    self.activityView.stopAnimating()
                    self.activityView.hidden = true
                    self.connectionStatusLabel.hidden = false
                }
            } catch {
                print("You errored out tough bruh")
            }
        }
        
        task.resume()
    }
}
