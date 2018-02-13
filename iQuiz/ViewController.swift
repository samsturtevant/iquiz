//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let subjectRepo = SubjectRepository.shared
    var subjects : [Subject]? = nil
    var subjectSelect : Subject? = nil
    
    @IBOutlet weak var TblSubjects: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("numberOfRowsInSection called")
        return subjects!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("We are being asked for indexPath \(indexPath)")
        let index = indexPath.row
        let subjectCell = subjects![index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = subjectCell.title
        cell.detailTextLabel?.text = subjectCell.description
        cell.imageView?.image = #imageLiteral(resourceName: "Marvel")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subjectSelect = subjects?[indexPath.row]
        NSLog((subjectSelect?.title)!)
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjects = subjectRepo.getSubjects()
        
        // Do any additional setup after loading the view, typically from a nib.
        TblSubjects.dataSource = self
        TblSubjects.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SVCSegue"?:
            let indexPath = TblSubjects.indexPathForSelectedRow!
            let source = segue.source as! ViewController
            let destination = segue.destination as! QuestionView
            destination.subject = source.subjects?[indexPath.row]
            destination.index = 0
        default:
            NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
    }

}

