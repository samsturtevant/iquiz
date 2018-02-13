//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class AnswerView: UIViewController {
    
    @IBOutlet weak var TblSubjects: UITableView!
    
    var subject : Subject? = nil
    var index = 0
    var answer = ""
    var correct = 0
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var correctText: UILabel!
    @IBOutlet weak var responseText: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = subject?.questions[index - 1]
        answerText.text = answer
        correctText.text = subject?.correct[index - 1]
        if answer == correctText.text {
            responseText.text = "Correct! :)"
        } else {
            responseText.text = "Incorrect... :("
        }
        if index < (subject?.questions.count)! {
            finishButton.isEnabled = false
            finishButton.alpha = 0
            nextButton.isEnabled = true
            nextButton.alpha = 100
        } else {
            nextButton.isEnabled = false
            nextButton.alpha = 0
            finishButton.isEnabled = true
            finishButton.alpha = 100
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "NextSegue"?:
            let source = segue.source as! AnswerView
            let destination = segue.destination as! QuestionView
            destination.subject = source.subject
            destination.index = index
            destination.correct = correct
        case "FinishSegue"?:
            let source = segue.source as! AnswerView
            let destination = segue.destination as! FinishView
            destination.subject = source.subject
            destination.index = index
            destination.correct = correct
        default:
            NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
    }
    
}



