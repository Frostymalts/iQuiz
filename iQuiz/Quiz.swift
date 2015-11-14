//
//  Quiz.swift
//  iQuiz
//
//  Created by Joshua Malters on 11/13/15.
//  Copyright © 2015 Joshua Malters. All rights reserved.
//

import Foundation

struct Question {
    var question:String
    var answers: [String]
    var correctAnswer: String

    init(question:String, answers:[String], correctAnswer:String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
