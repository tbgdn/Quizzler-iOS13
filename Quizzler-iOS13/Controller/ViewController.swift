//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userScore: UILabel!
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        progressBar.progress = 0.0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            self.updateUi()
        }
    }
    
    func updateUi(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        userScore.text = "Score: \(quizBrain.getScore())"
        
        firstChoice.setTitle(quizBrain.getFirstAnswer(), for: .normal)
        secondChoice.setTitle(quizBrain.getSecondAnswer(), for: .normal)
        thirdChoice.setTitle(quizBrain.getThirdAnswer(), for: .normal)
        
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
    }
    
}

