//
//  Basics.swift
//  Swift View
//
//  Created by asia on 07/04/2024.
//

import Foundation


struct Learn {
    var id: Int
    let title: String
    let description: String
    let image: String
}

extension Learn {
    static let variables: [Learn] = [
        Learn(
            id: 1001,
            title: "Variables",
            description: "When you want to name a value that may change during the lifetime of the app, you'll use a variable. You define variables using the var keyword",
            image: "variableExample"
        ),
        
        Learn(
            id: 1002,
            title: "Constants",
            description: "When you want to name a value that won't change during the lifetime of the program, you'll use a constant. You define constants in Swift using the let keyword.",
            image: "constantExample"
        )
    ]
    
    static let operators: [Learn] = [
        Learn(
            id: 1003,
            title: "Operators",
            description: "An operator is special symbol or phrase which is used to check, change or combine values. It tells the compiler to perform specific mathematical or logical manipulations. For example, the addition operator (+) adds two numbers, the logical AND operator (&&) combines two Boolean values. In programming, an operator makes your code work by performing an action on the values to its left and right. When you're reding code and see an unfamiliar symbol chances are it's an operator.",
            image: "operatorExample"
        )
    ]
    
    static let interpolation: [Learn] = [
        Learn(
            id: 1004,
            title: "String Interpolation",
            description: "The subject is quite self-explaining – it’s all about interpolating values into strings. In other words, adding a string to another string.",
            image: "stringExample"
        )
    ]
    
    static let controlflow: [Learn] = [
        Learn(
            id: 1005,
            title: "Control Flow",
            description: "Control flow refers to the order in which your program executes code. It is crucial in enabling your program to perform more than just a single task, and Swift offers several control flow structures that can be divided into two broad categories: loops and conditionals.",
            image: "controlflow2"
        )
    ]
    
    static let arrays: [Learn] = [
        Learn(
            id: 1006,
            title: "Arrays",
            description: "Arrays are used to store multiple values of same data type. An Array is just like a container which holds multiple data / values of a data type in an ordered list. When you fetch the data, you will get the elements in the same order as you defined in the array. An array can store values of any data type e.g. Int, String, Bool, etc.",
            image: "arrayExample"
        )
    ]
    
    static let dictionaries: [Learn] = [
        Learn(
            id: 1007,
            title: "Dictionaries",
            description: "Swift dictionary is a list of keys, each with an associated value. Each key must be unique, just like each word in the dictionary is unique. And just as an English dictionary is in alphabetical order to make the words easy to look up, a Swift dictionary is optimized to make key lookups very fast. You can set up a dictionary literal: a list of comma-separated key/value pairs surrounded by square brackets. A colon separates each key and its resulting value:",
            image: "dictionaryExample"
        )
    ]
    
    static let forloops: [Learn] = [
        Learn(
            id: 1008,
            title: "For Loops",
            description: "A for loop is useful for repeating something a set number of times or for performing work across a collection of values. A for-in loop executes a set of statements for each item within a range,sequence, or collection. Suppose you have a range of numbers between 1 and 5, and you want to print each value within the range. Rather than writing out five print statements, you can use for-in over the range and write one print statement.",
            image: "forloopExample"
        )
    ]
    
    static let whileloops: [Learn] = [
        Learn(
            id: 1009,
            title: "While Loops",
            description: "A while loop statement in Swift programming language repeatedly executes a designated statement as long as a given condition remains true. The condition is very crucial in the while loop it prevents the loop from becoming an infinite loop. So always check the condition in the while loop. The key point of a while loop is that the loop might not ever run. When the condition is tested and the result is false, the loop body will be skipped and the first statement after the while loop will be executed.",
            image: "whileloopExample"
        )
    ]
    
    static let functions: [Learn] = [
        Learn(
            id: 1010,
            title: "Functions",
            description: "Function plays an important role in structuring code, modularity and increasing code readability. They also provide various features such as parameter labels, default parameter values, variadic parameters, and multiple return types. In Swift, a function is defined by the \"func\" keyword. When a function is newly defined, it may take one or several values as input 'parameters' to the function and it will process the functions in the main body and pass back the values to the functions as output 'return types'.",
            image: "functionExample"
        )
    ]
    
    static let optionals: [Learn] = [
        Learn(
            id: 1011,
            title: "Optionals",
            description: "One of the greatest strengths of Swift is its ability to read code and quickly understand data. When a function may or may not return data, Swift forces you to deal properly with both possible scenarios. Swift uses unique syntax called optionals, to handle this sort of case.",
            image: "optionalExample"
        )
    ]
    
    static let structs: [Learn] = [
        Learn(
            id: 1012,
            title: "Structs",
            description: "The structure is the most commonly used user-defined data type. It allows us to group the related data and operations into a single block. It is useful for encapsulating the data and the functionality into a single unit and provides more organized and readable code. In a structure, we can add functionality with the help of methods and properties.In Swift, a structure does not require any extra file or interface for implementation, we can define a structure into a single file and the external interface accesses this code automatically. Structure is a value type.",
            image: "structExample1"
        )
    ]
    
}




