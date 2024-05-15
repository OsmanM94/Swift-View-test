//
//  TextFieldUserAnswer.swift
//  Swift View
//
//  Created by asia on 15/04/2024.
//

import SwiftUI


struct TextFieldUserSolution: View {
    
    @Bindable var normalModel: NormalModel
   
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                TextField("", text: $normalModel.exercise.userSolution, prompt: Text("Your Solution").foregroundStyle(.gray))
                    .foregroundStyle(.orange)
                    .modifier(TextFieldModifier())
                    .submitLabel(.done)
                    .id(1001)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += ":"
                            }, label: ":")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "="
                            }, label: "=")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "\""
                            }, label: "\"")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "["
                            }, label: "[")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "]"
                            }, label: "]")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "*"
                            }, label: "*")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "/"
                            }, label: "/")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "-"
                            }, label: "-")
                            
                            Spacer()
                            
                            KeyboardHelper(action: {
                                self.normalModel.exercise.userSolution += "+"
                            }, label: "+")
                        }
                    }
                    .onChange(of: normalModel.exercise.userSolution) {
                        withAnimation {
                            scrollView.scrollTo(1001, anchor: .trailing)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            normalModel.isTapped = true
                        }
                    }
                    .onSubmit {
                        normalModel.solutionValidator()
                        normalModel.consoleValidator()
                        withAnimation {
                            normalModel.isTapped = false
                        }
                    }
                    .accessibilityLabel(Text("Try your solution for the given exercise."))
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    TextFieldUserSolution(normalModel: NormalModel())
}

