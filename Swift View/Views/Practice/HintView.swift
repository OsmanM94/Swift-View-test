//
//  Hint.swift
//  Swift View
//
//  Created by asia on 12/04/2024.


import SwiftUI

struct HintView: View {
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack (alignment: .leading, spacing: 30) {
                
                TextCard(description: "Hints and Tips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextCard(description: "Readability:")
                    .modifier(HeaderTextModifier2())
                    .font(settingsModel.largerText ? .title : nil)
                    .fontWeight(settingsModel.boldText ? .bold : nil)
                
                TextCard(description: "Well-formatted code is easier to read and understand. Therefore, the Generator enforces strict rules for the way you format your solution. Please use the appropriate format. This will help you in the long run.")
                    .font(settingsModel.largerText ? .title : nil)
                    .fontWeight(settingsModel.boldText ? .bold : nil)
                     
                ForEach(HintModel.sampleData, id: \.id) { item in
                    HintCard(title: item.title, descriptionText: item.descriptionText, incorrectExample: item.incorrectExample, correctExample: item.correctExample)
                }
            }
            .opacity(settingsModel.reduceTextBrightness ? 0.5 : 1)
            .padding()
        }
    }
}

struct HintModel: Identifiable, Hashable {
    var id: Int
    var title: String
    var descriptionText: String
    var incorrectExample: String
    var correctExample: String
}

extension HintModel {
    
    static let sampleData: [HintModel] = [
        
        HintModel(
            id: 3002,
            title: "Array Declaration 1",
            descriptionText: "When declaring arrays, ensure proper spacing and indentation for better readability.",
            incorrectExample: "var array=[1,25,30,70]",
            correctExample: "var array = [1, 25, 30, 70]"
        ),
        
        HintModel (
            id: 3003,
            title: "Array Declaration 2",
            descriptionText: "When declaring arrays, ensure proper spacing and indentation for better readability. Note: For array, set, and dictionary declarations, add quotes (\"\") for each element.",
            incorrectExample: "var array=[\"red\",\"green\",\"blue\",\"yellow\"]",
            correctExample: "var array = [\"red\", \"green\", \"blue\", \"yellow\"]"
        ),
        
        HintModel(
            id: 3004,
            title: "String Declaration",
            descriptionText: "Similar to arrays, use proper spacing and indentation when declaring strings.",
            incorrectExample: "var name=\"John\"",
            correctExample: "var name = \"John\""
        ),
        
        HintModel(
            id: 3005,
            title: "Set Declaration 1",
            descriptionText: "Ensure proper spacing and indentation when declaring sets.",
            incorrectExample: "var set = Set([1,2,3])",
            correctExample: "var set: Set = [1, 2, 3]"
        ),
        
        HintModel(
            id: 3006,
            title: "Set Declaration 2",
            descriptionText: "Ensure proper spacing and indentation when declaring sets. Note: For array, set, and dictionary declarations, add quotes (\"\") for each element.",
            incorrectExample: "var set = Set([\"red\", \"green\", \"blue\", \"yellow\"])",
            correctExample: "var set: Set = [\"red\", \"green\", \"blue\", \"yellow\"]"
        ),
        
        HintModel(
            id: 3008,
            title: "Conditional Statements",
            descriptionText: "Ensure proper indentation and spacing when writing conditional statements for better code organization.",
            incorrectExample: "if(condition) {",
            correctExample: "if condition { }"
        ),
        
        HintModel(
            id: 3009,
            title: "Array Example",
            descriptionText: "Declare an array 'names' with the following elements: [\"John\", \"Alice\"]. Remove the element at index 1.",
            incorrectExample: "var names=[\"John\",\"Alice\"],names.remove(at: 1)",
            correctExample: "var names = [\"John\", \"Alice\"], names.remove(at: 1)"
        ),
        
        HintModel(
            id: 3010,
            title: "Addition Operation Example",
            descriptionText:"Declare a constant 'width' and set it to 50. Add 20 to 'width' and print the result to the console.",
            incorrectExample: "let width=50,width +=20",
            correctExample: "let width = 50, width += 20"
        ),
        
        HintModel(
            id: 3011,
            title: "Subtraction Operation Example",
            descriptionText: "Declare a variable 'total' and set it to 20. Substract 8 from 'total' and print the result to the console.",
            incorrectExample: "var total=20,total-=8",
            correctExample: "var total = 20, total -= 8"
        ),
        
        HintModel(id: 3012, title: "Printing to console", descriptionText: "Printing to console is a straight forward process.", incorrectExample: "print(  value)", correctExample: "print(value)")
    ]
}

struct HintCard: View {
    
    let title: String
    let descriptionText: String
    let incorrectExample: String
    let correctExample: String
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        Text(title)
            .modifier(HeaderTextModifier2())
            .font(settingsModel.largerText ? .title : nil)
            .fontWeight(settingsModel.boldText ? .bold : nil)
        
            Text(descriptionText)
                .font(settingsModel.largerText ? .title : nil)
                .fontWeight(settingsModel.boldText ? .bold : nil)
        
        
        VStack(alignment: .leading, spacing: 12) {
          
            
            ScrollView(.horizontal) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(incorrectExample)
                        LegendIcon(iconName: "x.circle.fill", color: .gray, imageSize: 25)
                    }
                    
                    HStack {
                        Text(correctExample)
                        LegendIcon(iconName: "checkmark.circle.fill", color: .green, imageSize: 25)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .modifier(HintExamplesTextModifier())
        
        Divider()
    }
}

#Preview {
    HintView()
        .environment(Settings())
}



