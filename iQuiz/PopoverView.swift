//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class PopoverView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PopoverSegue"?:
            let destination = segue.destination as! ViewController
            destination.url = URL(string: textField.text!)
        default:
            NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
    }
    
}





