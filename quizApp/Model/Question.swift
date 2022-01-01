//
//  Question.swift
//  quizApp
//
//  Created by Mustafa on 27.12.2021.
//

import Foundation

struct Question {
    
    let text: String
    let answer: [String]
    let cAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        cAnswer = correctAnswer
    }
    
}

struct Answer {
    
    let firstOption: String
    let secondOption: String
    let thirdOption: String
    let fourthOption: String
    
    init(first: String, second: String, third: String, fourth: String) {
        firstOption = first
        secondOption = second
        thirdOption = third
        fourthOption = fourth
    }
    
}
