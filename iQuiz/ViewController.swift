//
//  ViewController.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/3/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let subjects = [
        "Mathematics", "Marvel Super Heroes", "Science"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsPressed(sender: UIBarButtonItem) {
        let title = "Settings go here"
        let controller = UIAlertController(title: title, message: nil,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return subjects.count
    }
    
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
            
            cell!.textLabel?.text = subjects[indexPath.row]
            cell!.textLabel?.font = UIFont .boldSystemFontOfSize(18)
            cell!.detailTextLabel?.text = "Hella single-origin coffee intelligentsia, plaid trust fund keffiyeh 8-bit."
            cell!.detailTextLabel?.font = UIFont.systemFontOfSize(12)
            return cell!
    }
    
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let rowValue = subjects[indexPath.row]
            let message = "You selected \(rowValue)"
            
            let controller = UIAlertController(title: "Hooray",
                message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Yes I Did",
                style: .Default, handler: nil)
            controller.addAction(action)
            
            presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return indexPath.row == 0 ? 120 : 70
    }



}

