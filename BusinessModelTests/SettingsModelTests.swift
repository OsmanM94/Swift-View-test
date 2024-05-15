//
//  SettingsModelTests.swift
//  PracticeModelTests
//
//  Created by asia on 06/05/2024.
//

import XCTest
@testable import Swift_View


final class SettingsModelTests: XCTestCase {

    var settings: Settings!

    override func setUp() {
        super.setUp()
        settings = Settings()
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    override func tearDown() {
        settings = nil
        super.tearDown()
    }
    
    func test_SettingsModel_defaultValuesAreSetCorrectly() {
        XCTAssertFalse(settings.showSplash)
        XCTAssertTrue(settings.systemScheme)
    }
    
    func test_SettingsModel_largerText() {
        UserDefaults.standard.set(false, forKey: "largerText")
        
        let largerText = settings.largerText
        
        XCTAssertFalse(largerText)
    }
    
    func test_SettingsModel_toggleTrueLargerText() {
        settings.largerText = true
        
        let value = UserDefaults.standard.bool(forKey: "largerText")
        
        XCTAssertTrue(value)
    }
    
    func test_SettingsModel_boldText() {
        UserDefaults.standard.set(false, forKey: "boldText")
        
        let boldText = settings.boldText
        
        XCTAssertFalse(boldText)
    }
    
    func test_SettingsModel_toggleTrueBoldText() {
        settings.boldText = true
        
        let value = UserDefaults.standard.bool(forKey: "boldText")
        
        XCTAssertTrue(value)
    }
    
    func test_SettingsModel_sensoryFeedback() {
        settings.haptic = true
        
        settings.sensoryFeedback()
        
        XCTAssertTrue(settings.haptic)
    }
    
    func test_SettingsModel_dismissSplashAfterDelay() {
        let expectation = XCTestExpectation(description: "Wait for splash to dismiss")
        
        settings.dismissSplashAfterDelay()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            XCTAssertTrue(self.settings.showSplash)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.2)
    }
}
