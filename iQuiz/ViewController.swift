//
//  ViewController.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var json: [[String:Any]] = [[:]]
    var url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
    
    @IBOutlet weak var TblSubjects: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("numberOfRowsInSection called")
        return json.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("We are being asked for indexPath \(indexPath)")
        let index = indexPath.row
        let subjectCell = self.json[index] as [String:Any]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = subjectCell["title"] as? String
        cell.detailTextLabel?.text = subjectCell["desc"] as? String
        cell.imageView?.image = #imageLiteral(resourceName: "Marvel")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = json[indexPath.row] as [String : Any]
        print(self.json[indexPath.row])
        NSLog(((subject["title"])! as? String)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request(url: url!)
        
        // Do any additional setup after loading the view, typically from a nib.
        TblSubjects.dataSource = self
        TblSubjects.delegate = self
        self.TblSubjects.reloadData()
        
        let filePath = getDocumentsDirectory().appendingPathComponent("data.txt")
        let fileString = filePath.absoluteString
        
        (json as NSArray).write(toFile: fileString, atomically: true)
        self.TblSubjects.reloadData()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func request(url: URL) {
        URLSession.shared.dataTask(with:url, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                self.json = jsonData
                self.TblSubjects.reloadData()
            } catch let error as NSError {
                print(error)
            }
        }).resume()
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
            destination.subject = source.json[indexPath.row]
            destination.index = 0
        case "PopoverSegue"?: break
        default:
            NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
    }
    
    
}



