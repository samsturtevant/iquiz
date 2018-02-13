//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class QuestionView: UIViewController {
    
    @IBOutlet weak var TblSubjects: UITableView!
    
    var subject : Subject? = nil
    var index = 0
    var correct = 0
    var answer = ""
    
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isEnabled = false
        questionText.text = subject?.questions[index]
        answerOne.setTitle(subject?.answers[index][0], for: .normal)
        answerTwo.setTitle(subject?.answers[index][1], for: .normal)
        answerThree.setTitle(subject?.answers[index][2], for: .normal)
        answerFour.setTitle(subject?.answers[index][3], for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onePressed(_ sender: Any) {
        yourAnswer.text = subject?.answers[index][0]
        submitButton.isEnabled = true
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        yourAnswer.text = subject?.answers[index][1]
        submitButton.isEnabled = true
    }
    
    @IBAction func threePressed(_ sender: Any) {
        yourAnswer.text = subject?.answers[index][2]
        submitButton.isEnabled = true
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        yourAnswer.text = subject?.answers[index][3]
        submitButton.isEnabled = true
    }
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SubmitSegue"?:
            answer = yourAnswer.text!
            let source = segue.source as! QuestionView
            let destination = segue.destination as! AnswerView
            destination.subject = source.subject
            destination.answer = source.answer
            if yourAnswer.text == subject?.correct[index] {
                correct = correct + 1
            }
            index = index + 1
            destination.index = index
            destination.correct = correct
        default:
            NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
    }
    
}


