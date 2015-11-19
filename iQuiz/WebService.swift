//
//  WebService.swift
//  iQuiz
//
//  Created by iGuest on 11/18/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

class WebService {
    
    static func fetchAndParseJSONFromURL(url:String, completionHandler: (quizData: [AnyObject]) -> ()) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: url)
        
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        var quizzes = [AnyObject]()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                completionHandler(quizData: quizzes)
            } catch {
                print("You errored out tough bruh")
            }
        }
      
        task.resume()
    }
}