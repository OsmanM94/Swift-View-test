import SwiftUI

struct NormalView: View {
    
    @State private var normalModel = NormalModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView(.vertical) {
                    NormalExerciseView(normalModel: normalModel)
                        .navigationTitle("Normal")
                }
                ActionButtonsView(normalModel: normalModel)
                    
            }
        }
    }
}

struct NormalExerciseView: View {
    
    @Bindable var normalModel: NormalModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            InterfaceDots()
                .padding([.leading, .bottom])
            
            ExerciseDisplay(action1: "\(normalModel.exercise.exercise)")
                .accessibilityLabel("This is the given exercise")
            
            HStack {
                
                TextFieldUserSolution(normalModel: normalModel)
                    .accessibilityLabel("Try your solution")

                ZStack {
                    
                    CheckMark(action: normalModel.isCorrectSolution ? "checkmark.circle.fill" : "circle.dashed", color: normalModel.isCorrectSolution ? .green : .white)
                        .accessibilityLabel("CheckMark if your solution is correct")
                        
                    Xmark(action: "x.circle.fill", value: normalModel.wrongSolution)
                        .opacity(normalModel.wrongSolution ? 1 : 0)
                        .accessibilityLabel("Xmark if your solution is wrong")
                    
                }
            }
            .padding(.horizontal)
            
            if normalModel.printHasElements()  {
                
                EllipsisDots(value: normalModel.ellipsisAnimation, color: normalModel.isCorrectSolution ? .green : .white)
                    .opacity(normalModel.isCorrectSolution ? 1 : 0.5)
                    .onChange(of: normalModel.isCorrectSolution) {
                        normalModel.ellipsisAnimation.toggle()
                    }
                    .accessibilityLabel("simple dots appearing only if your solution is correct")
                
                HStack {
                    
                    TextFieldUserPrint(normalModel: normalModel)
                        .disabled(!normalModel.isCorrectSolution || normalModel.isCorrectPrint)
                        .accessibilityLabel("This is where your print to console.")
                    
                    ZStack {
                        
                        CheckMark(action: normalModel.isCorrectPrint ? "checkmark.circle.fill" : "circle.dashed" , color: normalModel.isCorrectPrint ? .green : .white)
                            .accessibilityLabel("Console checkmark")
                        
                    }
                }
                .padding(.bottom)
                .padding(.horizontal)
                
            }
            
            if normalModel.printHasElements() {
                
                VStack {
                    Monitor()
                        .overlay(
                            Text(normalModel.exercise.console ?? "")
                                .opacity(normalModel.isCorrectPrint ? 1 : 0)
                                .fontWeight(.semibold)
                                .padding(.bottom)
                                .foregroundStyle(normalModel.isCorrectPrint ? .white : .gray)
                                
                            
                        )
                        .accessibilityLabel("This is the console output")
                }
                .alignment(.center)
            }
        }
        .modifier(InterfaceModifier())
        .padding(.top)
        .padding(.horizontal, 5)
        .toolbar {
            ToolbarItem {
                ShowSolutionButton(
                    action1: { normalModel.showingSolutionAlert.toggle() },
                    action2: { },
                    title: "Show Solution"
                )
            }
            
            ToolbarItem {
                HintButton(
                    action1: { normalModel.showHint.toggle() }
                )
            }
        }
        .alert(isPresented: $normalModel.showingSolutionAlert) {
            Alert(
                title: Text("Solution"),
                message: Text(normalModel.exercise.answer.lazy.map { $0.replacingOccurrences(of: "[\\\"]", with: "", options: .regularExpression) }.joined(separator: "\n")),
                dismissButton: .default(Text("OK"))
            )
        }
        .sheet(isPresented: $normalModel.showHint) {
            HintView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct ActionButtonsView: View {
    
    @Bindable var normalModel: NormalModel
    
    @Environment(Settings.self) var settingsModel
    
    var body: some View {
        
        VStack {
            if settingsModel.longPressGenerator {
                LongPressGenerator(
                    action1: normalModel.loadExerciseData ,
                    action2: normalModel.turnOffChecks
                )
            } else {
                GeneratorButton(action1: normalModel.loadExerciseData,
                                action2: normalModel.turnOffChecks,
                                title: "Generate")
            }
        }
        .opacity(normalModel.isTapped ? 0 : 1)
        .padding([.bottom, .horizontal])
    }
}

#Preview {
    NormalView()
        .environment(Settings())
}
