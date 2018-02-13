//
//  SubjectRepository.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import Foundation

class Subject {
    init(title : String, description : String, questions : [String], answers : [[String]], correct : [String]) {
        self.title = title
        self.description = description
        self.questions = questions
        self.answers = answers
        self.correct = correct
    }
    var title = ""
    var description = ""
    var questions : [String]
    var answers : [[String]]
    var correct : [String]
}

class SubjectRepository {
    // Create
    // Retrieve
    // Update
    // Delete
    
    static let shared = SubjectRepository()
    
    func getSubjects() -> [Subject] {
        return subjects
    }
    func getSubject(id: Int) -> Subject {
        return subjects[id]
    }
    
    func removeSubject(id: Int) {
        // remove from the array
    }
    
    func addSubject(name: String, description: String) {
        // add to the array
    }
    
    func update(subject: Subject) {
        // send the update back to the server
    }
    
    private let subjects : [Subject] = [
        Subject(title: "Mathematics", description: "Numbers and stuff", questions: ["1 + 1 = ?", "2 + 2 = ?"], answers: [["1", "2", "3", "4"], ["2", "4", "6", "8"]], correct: ["2", "4"]),
        Subject(title: "Science", description: "Chemicals and stuff", questions: ["What is H20?", "Why is Earth round?"], answers: [["Water", "Fire", "Earth", "Wind"], ["Gravity", "Magnets", "Equations", "Not Round"]], correct: ["Water", "Gravity"]),
        Subject(title: "Marvel Super Heroes", description: "Spider-Man and stuff", questions: ["Peter Parker is...?", "Tony Stark is...?"], answers: [["Spider-Man", "Spooder-Dude", "Spidey-Boy", "Spaghett"], ["Iron Man", "Iran Man", "I ran, man", "IRA Man"]], correct: ["Spider-Man", "Iron Man"])
    ]
    
}
