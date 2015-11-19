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
        WebService.fetchAndParseJSONFromURL("http://tednewardsandbox.site44.com/questions.json") { quizData in
            if quizData.count == 0 {
                self.connectionStatusLabel.text = "No Connection"
            } else {
                self.connectionStatusLabel.text = "Successful Connection"
            }
            
            self.activityView.stopAnimating()
            self.activityView.hidden = true
            self.connectionStatusLabel.hidden = false
            print("Hello")
        }
    }
}
