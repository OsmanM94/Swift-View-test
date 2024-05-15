//
//  AdvancedView.swift
//  Swift View
//
//  Created by asia on 24/04/2024.
//

import SwiftUI

struct AdvancedView: View {
    
    @State private var advancedModel = AdvancedModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom)  {
                ScrollView (.vertical) {
                    AdvancedExerciseView(advancedModel: advancedModel)
                        .navigationTitle("Advanced")
                        
                    
                    NoteView()
                
                }
                .scrollIndicators(.hidden)
                
                GenerateButtonView(advancedModel: advancedModel)
                    .disabled(advancedModel.isTapped)
                    .opacity(advancedModel.isTapped ? 0 : 1)
            }
        }
    }
}


struct AdvancedExerciseView: View {
    
    @Bindable var advancedModel: AdvancedModel
  
    var body: some View {
        VStack(alignment: .leading) {
            
            InterfaceDots()
                .padding([.leading, .bottom])
            
            ExerciseDisplay(action1: "\(advancedModel.exercises[advancedModel.index].instruction)")
                .accessibilityLabel("This is where the given exercise is displayed")
                
            TextEditor(text: $advancedModel.textEditor)
                .frame(height: 200)
                .foregroundStyle(.orange)
                .textEditorStyle(.automatic)
                .background(Color(.gray.opacity(0.2)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .modifier(TextFieldModifier())
                .padding(.bottom)
                .scrollContentBackground(.hidden)
                .onTapGesture {
                    withAnimation {
                        advancedModel.isTapped.toggle()
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += ":"
                        }, label: ":")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "="
                        }, label: "=")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "{"
                        }, label: "{")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "}"
                        }, label: "}")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "("
                        }, label: "(")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += ")"
                        }, label: ")")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "["
                        }, label: "[")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "]"
                        }, label: "]")
                        
                        Spacer()
                        
                        KeyboardHelper(action: {
                            self.advancedModel.textEditor += "\""
                        }, label: "\"")
                        
                    }
                }
                .accessibilityLabel("This is where you try your solution.")
            
            HStack {
                
                CheckMark(action: advancedModel.wordMatch(exercise: advancedModel.exercises[advancedModel.index]) ? "checkmark.circle.fill" : "circle.dashed" , color: advancedModel.wordMatch(exercise: advancedModel.exercises[advancedModel.index]) ? .green : .white )
                    .accessibilityLabel("Checkmark will automatically appear if your solution is correct.")
                    
                RestartTextButton(action1: { advancedModel.textEditor = "" } )
                    .disabled(advancedModel.textEditor.isEmpty)
                    .foregroundStyle(advancedModel.textEditor.isEmpty ? .gray.opacity(0.8) : .red)
                    .accessibilityLabel("This button will restart your solution")
                
            }
            .alignment(.center)

            if advancedModel.showSolution {
                Text("\(advancedModel.exercises[advancedModel.index].solution[0])")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
        .onTapGesture {
            withAnimation {
                advancedModel.hideKeyboard()
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                ShowSolutionButton(
                    action1: { advancedModel.showSolution.toggle() },
                    action2: { },
                    title: "Show Solution"
                )
                
                DoneButton(
                    action1: { advancedModel.hideKeyboard() },
                    action2: { advancedModel.showSolution = false  }
                )
                .foregroundStyle(!advancedModel.isTapped && !advancedModel.showSolution ? .gray.opacity(0.8) : .blue)
                .disabled(!advancedModel.isTapped && !advancedModel.showSolution)
                .accessibilityLabel("You can press to dismiss the keyboard")
            }
        }
        .modifier(InterfaceModifier())
        .padding(.top)
        .padding(.horizontal, 5)
    }
}

struct NoteView: View {
    
    var body: some View {
        TextCard(description: "Note: Your solution is automatically checked. If it's correct, then a checkmark will be displayed.")
            .font(.subheadline)
            .padding(.horizontal)
            .accessibilityLabel("Your solution is automatically checked. If it's correct, then a checkmark will be displayed. Enable sensory feedback to get confirmation.")
    }
}

struct GenerateButtonView: View {
    
    @Bindable var advancedModel: AdvancedModel
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        VStack {
            
            if settingsModel.longPressGenerator {
                LongPressGenerator(
                    action1: advancedModel.generateAdvancedExercise,
                    action2: {}
                )
            } else {
                GeneratorButton(
                    action1: { advancedModel.generateAdvancedExercise() },
                    action2: { },
                    title: "Generate"
                )
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    AdvancedView()
        .environment(Settings())
}
