//
//  SubjectRepository.swift
//  iQuiz
//
//  Created by Sam Sturtevant on 2/11/18.
//  Copyright © 2018 Sam Sturtevant. All rights reserved.
//

import Foundation

class Subject {
    init(title : String, description : String) {
        self.title = title
        self.description = description
    }
    var title = ""
    var description = ""
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
        Subject(title: "Mathematics", description: "Numbers and stuff"),
        Subject(title: "Science", description: "Chemicals and stuff"),
        Subject(title: "Marvel Super Heroes", description: "Spider-Man and stuff"),
    ]
    
}
