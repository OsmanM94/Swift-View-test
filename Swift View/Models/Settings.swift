//
//  Settings.swift
//  Swift View
//
//  Created by asia on 16/04/2024.
//

import Foundation
import SwiftUI


@Observable
final class Settings {
   
    var showSplash: Bool = false
    
    var largerText: Bool {
            get {
                access(keyPath: \.largerText)
                return UserDefaults.standard.bool(forKey: "largerText")
            }
            set {
                withMutation(keyPath: \.largerText) {
                    UserDefaults.standard.setValue(newValue, forKey: "largerText")
                }
            }
    }
    
    var boldText: Bool {
            get {
                access(keyPath: \.boldText)
                return UserDefaults.standard.bool(forKey: "boldText")
            }
            set {
                withMutation(keyPath: \.boldText) {
                    UserDefaults.standard.setValue(newValue, forKey: "boldText")
                }
            }
    }
    
    var systemScheme: Bool = true
    
    var reduceTextBrightness: Bool {
            get {
                access(keyPath: \.reduceTextBrightness)
                return UserDefaults.standard.bool(forKey: "reduceTextBrightness")
            }
            set {
                withMutation(keyPath: \.reduceTextBrightness) {
                    UserDefaults.standard.setValue(newValue, forKey: "reduceTextBrightness")
                }
            }
    }
    
    var haptic: Bool {
        get {
            access(keyPath: \.haptic)
            return UserDefaults.standard.bool(forKey: "haptic")
        }
        set {
            withMutation(keyPath: \.haptic) {
                UserDefaults.standard.setValue(newValue, forKey: "haptic")
            }
        }
    }
    
    var batterySaver: Bool {
            get {
                access(keyPath: \.batterySaver)
                return UserDefaults.standard.bool(forKey: "batterySaver")
            }
            set {
                withMutation(keyPath: \.batterySaver) {
                    UserDefaults.standard.setValue(newValue, forKey: "batterySaver")
                }
            }
    }
    
    var navigationHaptic: Bool {
        get {
            access(keyPath: \.navigationHaptic)
            return UserDefaults.standard.bool(forKey: "navigationHaptic")
        }
        set {
            withMutation(keyPath: \.navigationHaptic) {
                UserDefaults.standard.setValue(newValue, forKey: "navigationHaptic")
            }
        }
    }
    
    var longPressGenerator: Bool {
        get {
            access(keyPath: \.longPressGenerator)
            return UserDefaults.standard.bool(forKey: "longPressGenerator")
        }
        set {
            withMutation(keyPath: \.longPressGenerator) {
                UserDefaults.standard.setValue(newValue, forKey: "longPressGenerator")
            }
        }
    }

    var darkMode: Bool {
        get {
            access(keyPath: \.darkMode)
            return UserDefaults.standard.bool(forKey: "darkMode")
        }
        set {
            withMutation(keyPath: \.darkMode) {
                UserDefaults.standard.setValue(newValue, forKey: "darkMode")
            }
        }
    }
    
    var lightMode: Bool {
        get {
            access(keyPath: \.lightMode)
            return UserDefaults.standard.bool(forKey: "lightMode")
        }
        set {
            withMutation(keyPath: \.lightMode) {
                UserDefaults.standard.setValue(newValue, forKey: "lightMode")
            }
        }
    }
    
    
    func sensoryFeedback() {
        if haptic == true {
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        }
    }
    
    func navigationSensoryFeedback() {
        if navigationHaptic == true {
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        }
    }
    
    func checkSystemScheme() {
        if darkMode && lightMode {
            darkMode = false
            lightMode = false
        }
        else {
            systemScheme = !darkMode && !lightMode
        }
    }
    
    func dismissSplashAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.showSplash = true
            }
        }
    }
    
    func showSplashAfterSchemeChange() {
        if lightMode || darkMode || systemScheme {
            self.showSplash = false
            dismissSplashAfterDelay()
        }
    }
    
    func enableBatterySaver() {
        lightMode = false
    }
}



