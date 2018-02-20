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
    
    var subject : [String : Any] = [:]
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
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        questionText.text = question!["text"] as? String
        answerOne.setTitle(answers?[0], for: .normal)
        answerTwo.setTitle(answers?[1], for: .normal)
        answerThree.setTitle(answers?[2], for: .normal)
        answerFour.setTitle(answers?[3], for: .normal)
        print(subject)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onePressed(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        yourAnswer.text = answers?[0]
        submitButton.isEnabled = true
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        yourAnswer.text = answers?[1]
        submitButton.isEnabled = true
    }
    
    @IBAction func threePressed(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        yourAnswer.text = answers?[2]
        submitButton.isEnabled = true
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        yourAnswer.text = answers?[3]
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
            let questions = subject["questions"] as? [[String : Any]]
            let question = questions![index] as [String : Any]
            let rightNumber = question["answer"]! as! String
            let answers = question["answers"] as! [String]
            if answer == answers[Int(rightNumber)! - 1] {
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


