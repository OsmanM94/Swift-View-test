//
//  PracticeModelTests.swift
//  PracticeModelTests
//
//  Created by asia on 16/04/2024.
//

import XCTest
@testable import Swift_View

final class PracticeModelTests: XCTestCase {

    var practice: NormalModel!
    
    override func setUp() {
        super.setUp()
        practice = NormalModel()
    }
        
    override func tearDown() {
        practice = nil
        super.tearDown()
    }
    
    
    // Ensure exercise is loaded
    func test_PracticeModel_isLoadingExerciseData() {
        XCTAssertNotNil(practice.exercise)
    }
    
    //MARK: - USER SOLUTION TESTS
    
    func test_PracticeModel_isCorrectUserSolution() {
        let correctExercise = Exercise(exercise: "Declare a constant named food and assign the value pizza.", answer: ["let food = \"pizza\"", "let food = \"Pizza\""], userSolution: "let food = \"pizza\"")
        
        XCTAssertTrue(practice.isCorrectUserSolution(exercise: correctExercise), "userSolution must contain one 'answer' element")
    }
    
    func test_PracticeModel_isIncorrectUserSolution() {
        let incorrectExercise = Exercise(exercise: "Declare a constant named food and assign the value pizza.", answer: ["let food = \"pizza\"", "let food = \"Pizza\""], userSolution: "let food = \"spaghetti\"")
        
        XCTAssertFalse(practice.isCorrectUserSolution(exercise: incorrectExercise), "userSolution shouldn't contain any 'answer' element.")
    }
    
    func test_PracticeModel_solutionValidator() {
        let correctExercise = Exercise(exercise: "Comment the word 'list'", answer: ["//list", "// list"], userSolution: "//list")
        
        practice.exercise = correctExercise
        practice.solutionValidator()
        
        XCTAssertTrue(practice.isCorrectSolution, "isCorrectSolution(checkmark) must turn TRUE if the 'userSolution' matches the element from 'answer' otherwise must stay FALSE.")
    }
    
    
    //MARK: - CONSOLE TESTS
    
    func test_PracticeModel_consoleValidator() {
        let correctExercise = Exercise(exercise: "Print greeting to console", print: "print(greeting)", userPrint: "print(greeting)")
        practice.exercise = correctExercise
        practice.consoleValidator()
        
        XCTAssertTrue(practice.isCorrectPrint, "isCorrectPrint(checkmark) must turn TRUE if the 'userPrint' matches the element from 'print' otherwise must stay FALSE.")
    }
    
    func test_PracticeModel_BothPrintsNotNil() {
        let exercise = Exercise(exercise: "", print: "print", userPrint: "print")
        
        XCTAssertTrue(practice.isCorrectUserPrint(exercise: exercise), "print and user-print should be non-nil and also match")
    }
    
    func test_PracticeModel_UserPrintNil() {
        let exercise = Exercise(exercise: "", print: "print", userPrint: nil)
       
        XCTAssertFalse(practice.isCorrectUserPrint(exercise: exercise), "userPrint should be nil")
    }
    
    func test_PracticeModel_PrintIsNil() {
        let exercise = Exercise(exercise: "", print: nil, userPrint: "print")
       
        XCTAssertFalse(practice.isCorrectUserPrint(exercise: exercise), "'print' should be nil")
    }
    
}
