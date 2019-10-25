//
//  Question.swift
//  Quizzler
//
//  Created by Giulia Ariu on 20/10/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

//Structure for every single question in our app

class Question
{
    //Property of the question class, even though it's a constant
    let questionText : String
    
    let answer : Bool
    
    //This method determines what happens when a new question object is created from this question class
    init(text: String, correctAnswer : Bool)
    {
        questionText = text
        answer = correctAnswer
        
    }
}
