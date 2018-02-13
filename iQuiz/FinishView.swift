//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class FinishView: UIViewController {
    
    @IBOutlet weak var TblSubjects: UITableView!
    
    var subject : Subject? = nil
    var index = 0
    var correct = 0
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(correct)
        totalLabel.text = String(index)
        let percentage = Double(correct) / Double(index)
        var response = ""
        if percentage == 1 {
            response = "Perfect!"
        } else if percentage >= 0.75 {
            response = "Great job!"
        } else if percentage >= 0.5 {
            response = "Good work."
        } else if percentage >= 0.25 {
            response = "Nice try..."
        } else {
            response = "Whoops..."
        }
        responseLabel.text = response
    }
    
}




