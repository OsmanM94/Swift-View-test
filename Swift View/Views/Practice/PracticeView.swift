//
//  PracticeView.swift
//  Swift View
//
//  Created by asia on 26/04/2024.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        NormalView()
                    } label: {
                        Text("Normal")
                    }

                } header: {
                    TextCard(description: "Beginner")
                } footer: {
                    TextCard(description: "Practice micro Swift challenges.")
                }

                Section {
                    NavigationLink {
                        AdvancedView()
                    } label: {
                        Text("Advanced")
                    }
                    
                } header: {
                    TextCard(description: "Intermediate")
                } footer: {
                    TextCard(description: "Practice advanced Swift challenges.")
                }
                
                DisclosureGroup("Legend") {
                    
                    LabeledContent("Your solution is correct") {
                        LegendIcon(iconName: "checkmark.circle.fill", color: .green, imageSize: 23)
                            
                    }
                    LabeledContent("Your solution is wrong") {
                        LegendIcon(iconName: "x.circle.fill", color: .gray, imageSize: 23)
                            
                    }
                    LabeledContent("Check hints") {
                        LegendIcon(iconName: "lightbulb.fill", color: .orange, imageSize: 23)
                            
                    }
                    LabeledContent("Reset text") {
                        LegendIcon(iconName: "memories", color: .red, imageSize: 23)
                            
                    }
                    LabeledContent("Generate exercise") {
                        LegendGenerateIcon(title: "Generate", backgroundColor: .blue, padding: 5, horizontalPadding: 30, color: .white, cornerRadius: 8)
                    }
                    LabeledContent("Show the solution") {
                        LegendGenerateIcon(title: "Show Solution", backgroundColor: .blue , padding: 5, horizontalPadding: 2, color: .white, cornerRadius: 15)
                    }
                    LabeledContent("Dismiss keyboard") {
                        TextCard(description: "Done")
                            .foregroundStyle(.blue)
                    }
                }
                .accessibilityLabel("Check legend and what some buttons does")
            }
            .navigationTitle("Practice")
        }
    }
}

#Preview {
    PracticeView()
        .environment(Settings())
}
