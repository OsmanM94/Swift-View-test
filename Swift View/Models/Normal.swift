//
//  ModelData.swift
//  Swift View
//
//  Created by asia on 30/03/2024.
//

import Foundation


@Observable
final class NormalModel {
    
    var exercise: Exercise
    var isCorrectSolution: Bool = false
    var isCorrectPrint: Bool = false
    var showHint: Bool = false
    var showingSolutionAlert: Bool = false
    var wrongSolution: Bool = false
    var ellipsisAnimation: Bool = false
    var isTapped: Bool = false
    
    let motivationWords: Set = [
        "Good job!",
        "Keep going you are doing great!",
        "Brilliant!",
        "You are performing well!",
        "You are improving.",
        "Nice!",
        "Nice, keep coding!",
        "Wow. You are a pro!",
        "Well done!.",
        "Keep doing great my friend!",
        "Impressive!",
        "Fantastic! You are doing well",
        "Nicely done.",
        "Keep up the great work!",
        "You're making progress!"
    ]
    
    init() {
        self.exercise = Exercise()
        loadExerciseData()
    }
    
    func loadExerciseData()  {
        if let exercises: [Exercise] = load("exercisesData.json") {
            if let randomExercise = exercises.randomElement() {
                self.exercise = randomExercise
            }
        }
    }

    func isCorrectUserSolution(exercise: Exercise) -> Bool {
        let isCorrect = exercise.answer.contains(where: exercise.userSolution.contains)
        return isCorrect
    }
    
    func solutionValidator() {
        let isCorrect = isCorrectUserSolution(exercise: exercise)
        print("DEBUG: isCorrectSolution: \(isCorrect)")
        if isCorrectUserSolution(exercise: exercise) {
            isCorrectSolution = true
            wrongSolution = false
        }
        else {
            wrongSolution = true
        }
    }
    
    func consoleValidator() {
        let isCorrect = isCorrectUserPrint(exercise: exercise)
        print("DEBUG: isCorrectPrint: \(isCorrect)")
        if isCorrectUserPrint(exercise: exercise) {
            isCorrectPrint = true
        }
    }
    
    func isCorrectUserPrint(exercise: Exercise) -> Bool {
        guard let userPrint = exercise.userPrint,
              let exercisePrint = exercise.print
        else {
            return false
        }
        return userPrint.contains(exercisePrint)
    }
    
    func turnOffChecks() {
        isCorrectPrint = false
        isCorrectSolution = false
        wrongSolution = false
    }
    
    func printHasElements() -> Bool {
        if ((exercise.print?.isEmpty) != nil) {
            return true
        }
        return false
    }
    
}

   
    struct Exercise: Codable, Identifiable {
        let id: Int
        var exercise: String
        var answer: [String]
        var userSolution: String
        var print: String?
        var userPrint: String?
        var console: String?
        
        init(id: Int = 0, exercise: String = "", answer: [String] = [], userSolution: String = "", print: String? = nil, userPrint: String? = nil, console: String? = nil) {
            self.id = id
            self.exercise = exercise
            self.answer = answer
            self.userSolution = userSolution
            self.print = print
            self.userPrint = userPrint
            self.console = console
        }
    }
    
    // GLOBAL DECODER
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }


