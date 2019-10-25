//
//  ViewController.swift
//  Quizzler
//
//  Created by Giulia Ariu on 20/10/2018.
//  Copyright © 2018 Giulia Ariu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //A new question bank object
    let allQuestions = QuestionBank()
    
    //This is the answer that the user picked
    var pickedAnswer : Bool = false
    
    var questionIndex : Int = 0
    
    //Image Update
    var score : Int = 0
    
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        //In order to know if the user selected the right answer we have to compare their selected answer with the correct answer
        if (sender.tag == 1)
        {
            pickedAnswer = true
        }
        else if (sender.tag == 2)
        {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionIndex += 1
        
        nextQuestion()
  
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionIndex + 1) / 13"
        
        progressBarWidthConstraint.constant = (view.frame.size.width / CGFloat(allQuestions.list.count) ) * CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        
//        if questionIndex <= 12
        if questionIndex < allQuestions.list.count
        {
            //Inserting the text from the current question in the text of the question label placed in the view
            questionLabel.text = allQuestions.list[questionIndex].questionText
            
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "End of the quiz!", message: "Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionIndex].answer

        if (pickedAnswer == correctAnswer)
        {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        }
        else
        {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        
        questionIndex = 0
        score = 0
        nextQuestion()
        
    }
    

    
}
