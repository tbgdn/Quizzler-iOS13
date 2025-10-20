//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Bogdan Teslarasu on 04.10.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//
import Foundation

struct Question{
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
