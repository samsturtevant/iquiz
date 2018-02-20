//
//  SubjectRepository.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import Foundation

class Question {
    init(text: String, answer: Int, answers: [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
    var text : String
    var answer : Int
    var answers : [String]
    
}

class Subject {
    init(title : String, description : String, questions : [Question]) {
        self.title = title
        self.desc = description
        self.questions = questions
    }
    var title = ""
    var desc = ""
    var questions : [Question]
}

//class SubjectRepository {
//    // Create
//    // Retrieve
//    // Update
//    // Delete
//
//    static let shared = SubjectRepository()
//
//    func getSubjects() -> [Subject] {
//        return subjects
//    }
//    func getSubject(id: Int) -> Subject {
//        return subjects[id]
//    }
//
//    func removeSubject(id: Int) {
//        // remove from the array
//    }
//
//    func addSubject(name: String, description: String) {
//        // add to the array
//    }
//
//    func update(subject: Subject) {
//        // send the update back to the server
//    }
//
//    private let subjects : [Subject] = [
//        Subject(title: "Mathematics", description: "Numbers and stuff", questions: ["1 + 1 = ?", "2 + 2 = ?"], answers: [["1", "2", "3", "4"], ["2", "4", "6", "8"]], correct: ["2", "4"]),
//        Subject(title: "Science", description: "Chemicals and stuff", questions: ["What is H20?", "Why is Earth round?"], answers: [["Water", "Fire", "Earth", "Wind"], ["Gravity", "Magnets", "Equations", "Not Round"]], correct: ["Water", "Gravity"]),
//        Subject(title: "Marvel Super Heroes", description: "Spider-Man and stuff", questions: ["Peter Parker is...?", "Tony Stark is...?"], answers: [["Spider-Man", "Spooder-Dude", "Spidey-Boy", "Spaghett"], ["Iron Man", "Iran Man", "I ran, man", "IRA Man"]], correct: ["Spider-Man", "Iron Man"])
//    ]
//
//}

