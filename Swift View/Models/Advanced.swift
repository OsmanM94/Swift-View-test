//
//  AdvancedModel.swift
//  Swift View
//
//  Created by asia on 26/04/2024.
//

import Foundation
import SwiftUI


@Observable
class AdvancedModel {
    
    var index: Int = 0
    var textEditor: String = ""
    var showSolution: Bool = false
    var currentExerciseIndex: Int = 0
    var isTapped: Bool = false
    
    var exercises = AdvancedExercises.sampleData.lazy.map { $0 }
    
    func wordMatch(exercise: AdvancedExercises) -> Bool {
        let trimmedTextField = textEditor.replacingOccurrences(of: " ", with: "")
        return exercise.solution.contains { answer in
            let trimmedAnswer = answer.replacingOccurrences(of: " ", with: "")
            return trimmedTextField.contains(trimmedAnswer)
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isTapped = false
    }
    
    func generateAdvancedExercise() {
        index = (index + 1) % exercises.count
        textEditor = ""
        showSolution = false
    }
    
}


struct AdvancedExercises: Identifiable {
    var id: Int
    var instruction: String
    var solution: [String]
}

extension AdvancedExercises {
    static let sampleData: [AdvancedExercises] = [
        AdvancedExercises(id: 1001, instruction: "Create a struct named 'Book' containing properties 'title' of type String, 'author' of type String, and 'pages' of type Int.", solution: [
                    """
                    struct Book {
                        var title: String
                        var author: String
                        var pages: Int
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1002, instruction: "Define a class named 'Person' containing properties 'name' of type String and 'age' of type Int.", solution: [
                    """
                    class Person {
                        var name: String
                        var age: Int
                    
                        init(name: String, age: Int) {
                            self.name = name
                            self.age = age
                        }
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1003, instruction: "Create a function named 'calculateArea' that takes the width and height of a rectangle as input parameters and returns the area.", solution: [
                    """
                    func calculateArea(width: Double, height: Double) -> Double {
                        return width * height
                    }
                    """
        ]),
        AdvancedExercises(id: 1004, instruction: "Create a struct named 'Student' containing properties 'name' of type String and 'grade' of type Double.", solution: [
                    """
                    struct Student {
                        var name: String
                        var grade: Double
                    }
                    """
        ]),
        AdvancedExercises(id: 1005, instruction: "Define a class named 'Animal' containing properties 'name' of type String and 'age' of type Int.", solution: [
                    """
                    class Animal {
                        var name: String
                        var age: Int
                    
                        init(name: String, age: Int) {
                            self.name = name
                            self.age = age
                        }
                    }
                    """
        ]),
        AdvancedExercises(id: 1006, instruction: "Define a class named 'Person' containing properties 'name' of type String and 'age' of type Int.", solution: [
            """
            class Person {
                var name: String
                var age: Int
            
                init(name: String, age: Int) {
                    self.name = name
                    self.age = age
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1007, instruction: "Define a struct named 'Triangle' containing properties 'side1' of type Double, 'side2' of type Double, and 'side3' of type Double.", solution: [
                   """
                   struct Triangle {
                       var side1: Double
                       var side2: Double
                       var side3: Double
                   }
                   """
               ]),
        
        AdvancedExercises(id: 1008, instruction: "Define a class named 'Circle' containing a property 'radius' of type Double.", solution: [
                  """
                  class Circle {
                      var radius: Double
                  
                      init(radius: Double) {
                          self.radius = radius
                      }
                  }
                  """
              ]),
        
        AdvancedExercises(id: 1009, instruction: "Define a class named 'Vehicle' containing properties 'model' of type String and 'year' of type Int.", solution: [
                  """
                  class Vehicle {
                      var model: String
                      var year: Int
                  
                      init(model: String, year: Int) {
                          self.model = model
                          self.year = year
                      }
                  }
                  """
              ]),
              
        AdvancedExercises(id: 1010, instruction: "Create a struct named 'Point' containing properties 'x' of type Double and 'y' of type Double.", solution: [
                  """
                  struct Point {
                      var x: Double
                      var y: Double
                  }
                  """
              ]),
              
        AdvancedExercises(id: 1011, instruction: "Define a class named 'Computer' containing properties 'brand' of type String and 'ram' of type Int.", solution: [
                  """
                  class Computer {
                      var brand: String
                      var ram: Int
                  
                      init(brand: String, ram: Int) {
                          self.brand = brand
                          self.ram = ram
                      }
                  }
                  """
              ]),
              
        AdvancedExercises(id: 1012, instruction: "Create a struct named 'Line' containing properties 'start' and 'end' both of type 'Point'.", solution: [
                  """
                  struct Line {
                      var start: Point
                      var end: Point
                  }
                  """
              ]),
        
        AdvancedExercises(id: 1016, instruction: "Create a struct named 'Product' containing properties 'name' of type String, 'price' of type Double, and 'stock' of type Int.", solution: [
            """
            struct Product {
                var name: String
                var price: Double
                var stock: Int
            }
            """
        ]),
       
        AdvancedExercises(id: 1020, instruction: "Create a struct named 'Song' containing properties 'title' of type String, 'artist' of type String, and 'duration' of type Int.", solution: [
            """
            struct Song {
                var title: String
                var artist: String
                var duration: Int
            }
            """
        ]),
        
        AdvancedExercises(id: 1021, instruction: "Define a class named 'Department' containing properties 'name' of type String and 'employees' of type [Employee].", solution: [
            """
            class Department {
                var name: String
                var employees: [Employee]
                
                init(name: String, employees: [Employee]) {
                    self.name = name
                    self.employees = employees
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1023, instruction: "Define an enum named 'Direction' with cases 'north', 'south', 'east', and 'west'.", solution: [
                    """
                    enum Direction {
                        case north, south, east, west
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1024, instruction: "Create an enum named 'Day' with cases 'monday', 'tuesday', 'wednesday'.", solution: [
                    """
                    enum Day {
                        case monday, tuesday, wednesday
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1025, instruction: "Define an enum named 'Planet' with cases 'mercury', 'venus', 'earth', 'mars'.", solution: [
                    """
                    enum Planet {
                        case mercury, venus, earth, mars
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1026, instruction: "Create an enum named 'Suit' with cases 'hearts', 'diamonds', 'clubs', and 'spades'.", solution: [
                    """
                    enum Suit {
                        case hearts, diamonds, clubs, spades
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1027, instruction: "Define an enum named 'Color' with cases 'red', 'green', and 'blue'.", solution: [
                    """
                    enum Color {
                        case red, green, blue
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1028, instruction: "Create an enum named 'Direction' with cases 'up', 'down', 'left', and 'right'.", solution: [
                    """
                    enum Direction {
                        case up, down, left, right
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1030, instruction: "Create an enum named 'Month' with cases 'january', 'february', 'march'.", solution: [
                    """
                    enum Month {
                        case january, february, march
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1031, instruction: "Define an enum named 'Direction' with cases 'forward', 'backward', 'left', and 'right'.", solution: [
                    """
                    enum Direction {
                        case forward, backward, left, right
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1032, instruction: "Create an enum named 'Language' with cases 'swift', 'python', 'java'.", solution: [
                    """
                    enum Language {
                        case swift, python, java
                    }
                    """
        ]),
        
        AdvancedExercises(id: 1033, instruction: "let number = 10. Check if number is positive. Return true if it's greater than 0, otherwise false.", solution: [
                   """
                   if number > 0 {
                       return true
                   } else {
                       return false
                   }
                   """
        ]),
        
        AdvancedExercises(id: 1034, instruction: "let number = 10. Check if number is positive. Return true if it's greater than 0, otherwise false.", solution: [
                 """
                 if number > 0 {
                     return true
                 } else {
                     return false
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1035, instruction: "let number = -5. Check if number is negative. Return true if it's less than 0, otherwise false.", solution: [
                 """
                 if number < 0 {
                     return true
                 } else {
                     return false
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1036, instruction: "let number = 10. Check if number is even. Return true if it's even, otherwise false.", solution: [
                 """
                 if number % 2 == 0 {
                     return true
                 } else {
                     return false
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1037, instruction: "let number = 7. Check if number is odd. Return true if it's odd, otherwise false.", solution: [
                 """
                 if number % 2 != 0 {
                     return true
                 } else {
                     return false
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1038, instruction: "let age = 20. Check if a person is eligible to vote. Return true if the age is greater than or equal to 18, otherwise false.", solution: [
                 """
                 if age >= 18 {
                     return true
                 } else {
                     return false
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1039, instruction: "let num1 = 25, num2 = 35. Write an if-else statement to find the maximum of two numbers.", solution: [
                 """
                 if num1 > num2 {
                     return num1
                 } else {
                     return num2
                 }
                 """
             ]),
             
        AdvancedExercises(id: 1040, instruction: "let num1 = 25, num2 = 35. Write an if-else statement to find the minimum of two numbers.", solution: [
                 """
                 if num1 < num2 {
                     return num1
                 } else {
                     return num2
                 }
                 """
             ]),
        
        AdvancedExercises(id: 1041, instruction: "Declare two variables 'a' and 'b' with the values 10 and 20 respectively. Multiply 'a' and 'b' and store the result in a variable named 'result'.", solution: [
                   """
                   var a = 10
                   var b = 20
                   var result = a * b
                   """
               ]),
               
        AdvancedExercises(id: 1042, instruction: "let number = 10. Check if 'number' is positive. Return true if it's greater than 0, otherwise false.", solution: [
                   """
                   if number > 0 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1043, instruction: "Declare a variable 'x' with the value 15. Check if 'x' is less than or equal to 10 return true, otherwise false.", solution: [
                   """
                   var x = 15
                   
                   if x <= 10 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1044, instruction: "Declare a variable 'y' with the value 25. Check if 'y' is greater than 20 return true, otherwise false.", solution: [
                   """
                   var y = 25
                   
                   if y > 20 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1045, instruction: "Declare two variables 'num1' and 'num2' with values 50 and 25 respectively. Check if 'num1' is greater than 'num2' return true, otherwise false.", solution: [
                   """
                   var num1 = 50
                   var num2 = 25
                   
                   if num1 > num2 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1046, instruction: "Declare a variable 'z' with the value 0. Check if 'z' is equal to 0, return true, otherwise false.", solution: [
                   """
                   var z = 0
                   
                   if z == 0 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1047, instruction: "Declare two variables 'p' and 'q' with values 10 and 5 respectively. Check if 'p' is not equal to 'q' return true, otherwise false.", solution: [
                   """
                   var p = 10
                   var q = 5
                   
                   if p != q {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
               
        AdvancedExercises(id: 1048, instruction: "Declare a variable 'amount' with the value 100. Increment 'amount' by 50.", solution: [
                   """
                   var amount = 100
                   amount += 50
                   """
               ]),
               
        AdvancedExercises(id: 1049, instruction: "Declare a variable 'count' with the value 20. Decrement 'count' by 5.", solution: [
                   """
                   var count = 20
                   count -= 5
                   """
               ]),
               
        AdvancedExercises(id: 1050, instruction: "Declare a variable 'result' with the value 15. Check if 'result' is an odd number and return true, otherwise false.", solution: [
                   """
                   var result = 15
                   
                   if result % 2 != 0 {
                       return true
                   } else {
                       return false
                   }
                   """
               ]),
        
        AdvancedExercises(id: 1051, instruction: "Declare a variable 'temperature' with the value 25. Check if 'temperature' is greater than 30 and return 'Hot' if true, otherwise return 'Cool'.", solution: [
            """
            var temperature = 25
            
            if temperature > 30 {
                return "Hot"
            } else {
                return "Cool"
            }
            """
        ]),
        
        AdvancedExercises(id: 1052, instruction: "Create a function named 'isPositive' that takes an integer as input and returns true if it's positive, false otherwise.", solution: [
            """
            func isPositive(number: Int) -> Bool {
                if number > 0 {
                    return true
                } else {
                    return false
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1053, instruction: "Declare a constant 'hoursWorked' with the value 40. Check if 'hoursWorked' is greater than or equal to 40 and return 'Full-time', otherwise return 'Part-time'.", solution: [
            """
            let hoursWorked = 40
            
            if hoursWorked >= 40 {
                return "Full-time"
            } else {
                return "Part-time"
            }
            """
        ]),
        
        AdvancedExercises(id: 1054, instruction: "Declare a variable 'age' with the value 18. Check if 'age' is greater than or equal to 21 and return 'Allowed' if true, otherwise return 'Not Allowed'.", solution: [
            """
            var age = 18
            
            if age >= 21 {
                return "Allowed"
            } else {
                return "Not Allowed"
            }
            """
        ]),
        
        AdvancedExercises(id: 1056, instruction: "Declare a constant 'speedLimit' with the value 60. Check if 'speedLimit' is less than 50 and return 'Slow', if between 50 and 70 return 'Moderate', otherwise return 'Fast'.", solution: [
            """
            let speedLimit = 60
            
            if speedLimit < 50 {
                return "Slow"
            } else if speedLimit >= 50 && speedLimit <= 70 {
                return "Moderate"
            } else {
                return "Fast"
            }
            """
        ]),
        
        AdvancedExercises(id: 1057, instruction: "Declare a variable 'balance' with the value 1000. Check if 'balance' is greater than or equal to 500 and return 'Stable', otherwise return 'Low'.", solution: [
            """
            var balance = 1000
            
            if balance >= 500 {
                return "Stable"
            } else {
                return "Low"
            }
            """
        ]),
        
        AdvancedExercises(id: 1058, instruction: "Declare a constant 'temperature' with the value 10. Check if 'temperature' is less than 0 and return 'Freezing', if between 0 and 10 return 'Cold', otherwise return 'Warm'.", solution: [
            """
            let temperature = 10
            
            if temperature < 0 {
                return "Freezing"
            } else if temperature >= 0 && temperature <= 10 {
                return "Cold"
            } else {
                return "Warm"
            }
            """
        ]),
        
        AdvancedExercises(id: 1060, instruction: "Create a function named 'filterEvenNumbers' that takes an array of integers 'numbers' as input and returns an array containing only the even numbers. Use higher-order functions.", solution: [
            """
            func filterEvenNumbers(numbers: [Int]) -> [Int] {
                return numbers.filter { $0 % 2 == 0 }
            }
            """
        ]),
        
        AdvancedExercises(id: 1061, instruction: "Create a function named 'calculateSquare' that takes an array of integers 'numbers' as input and returns an array containing the square of each number. Use higher-order functions.", solution: [
            """
            func calculateSquare(numbers: [Int]) -> [Int] {
                return numbers.map { $0 * $0 }
            }
            """
        ]),
        
        AdvancedExercises(id: 1062, instruction: "Create a function named 'sumOfSquares' that takes an array of integers 'numbers' as input and returns the sum of the squares of all numbers. Use higher-order functions.", solution: [
            """
            func sumOfSquares(numbers: [Int]) -> Int {
                return numbers.map { $0 * $0 }.reduce(0, +)
            }
            """
        ]),
        
        AdvancedExercises(id: 1063, instruction: "Create a function named 'containsNegativeNumber' that takes an array of integers 'numbers' as input and returns true if the array contains any negative numbers, false otherwise. Use higher-order functions.", solution: [
            """
            func containsNegativeNumber(numbers: [Int]) -> Bool {
                return numbers.contains { $0 < 0 }
            }
            """
        ]),
        
        AdvancedExercises(id: 1064, instruction: "Create an empty array named 'names' to store strings.", solution: [
            """
            var names: [String] = []
            """
        ]),
        
        AdvancedExercises(id: 1065, instruction: "Add the string 'apple' to the end of the 'fruits' array.", solution: [
            """
            fruits.append("apple")
            """
        ]),
        
        AdvancedExercises(id: 1066, instruction: "var colors: [String] = ['red', 'green', 'blue']. Access the second element of the 'colors' array and assign it to a variable named 'selectedColor'.", solution: [
            """
            let selectedColor = colors[1]
            """
        ]),

        AdvancedExercises(id: 1069, instruction: "var colors: [String] = ['red', 'green', 'blue']. Replace the third element of the 'colors' array with 'yellow'.", solution: [
            """
            colors[2] = "yellow"
            """
        ]),
        
        AdvancedExercises(id: 1070, instruction: "Create a protocol named 'Vehicle' with a requirement 'drive' that takes no parameters and returns void.", solution: [
            """
            protocol Vehicle {
                func drive()
            }
            """
        ]),

        AdvancedExercises(id: 1071, instruction: "Create a protocol named 'Animal' with a requirement 'makeSound' that takes no parameters and returns a string.", solution: [
            """
            protocol Animal {
                func makeSound() -> String
            }
            """
        ]),

        AdvancedExercises(id: 1072, instruction: "Create a protocol named 'Shape' with a requirement 'calculateArea' that takes no parameters and returns a Double.", solution: [
            """
            protocol Shape {
                func calculateArea() -> Double
            }
            """
        ]),

        AdvancedExercises(id: 1074, instruction: "Define an enum named 'InvalidEmailError' with a case 'invalidFormat', representing an error when an email address has an invalid format.", solution: [
            """
            enum InvalidEmailError: Error {
                case invalidFormat
            }
            """
        ]),

        AdvancedExercises(id: 1075, instruction: "Define an enum named 'DivisionError' with a case 'divisionByZero', representing an error when attempting to divide by zero.", solution: [
            """
            enum DivisionError: Error {
                case divisionByZero
            }
            """
        ]),

        AdvancedExercises(id: 1076, instruction: "Define an enum named 'AgeError' with a case 'underage', representing an error when a person's age is below a certain threshold (e.g., 18).", solution: [
            """
            enum AgeError: Error {
                case underage
            }
            """
        ]),

        AdvancedExercises(id: 1077, instruction: "Define an enum named 'FileError' with a case 'fileNotFound', representing an error when a file cannot be found on disk.", solution: [
            """
            enum FileError: Error {
                case fileNotFound
            }
            """
        ]),
        
        AdvancedExercises(id: 1078, instruction: "Extend the Int type with a variable computed property 'isPositive' of type Bool that returns true if the number is positive (greater than 0), false otherwise.", solution: [
            """
            extension Int {
                var isPositive: Bool {
                    return self > 0
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1079, instruction: "Extend the String type with a variable computed property 'isNotEmpty' of type Bool that returns true if the string is not empty (contains at least one character), false otherwise.", solution: [
            """
            extension String {
                var isNotEmpty: Bool {
                    return !isEmpty
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1080, instruction: "Extend the Array type with a variable computed property 'isEmptyArray' of type Bool that returns true if the array is empty (contains no elements), false otherwise.", solution: [
            """
            extension Array {
                var isEmptyArray: Bool {
                    return isEmpty
                }
            }
            """
        ]),
        
        AdvancedExercises(id: 1081, instruction: "Declare a variable 'counter' with the value 0. Use a while loop to increment 'counter' until it reaches 5.", solution: [
            """
            var counter = 0
            
            while counter < 5 {
                counter += 1
            }
            """
        ]),

        
    ]
}


