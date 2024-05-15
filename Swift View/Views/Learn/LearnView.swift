//
//  SwiftList.swift
//  Swift View
//
//  Created by Osman M. on 21/03/2024.
//

import SwiftUI

struct LearnView: View {
    
    var body: some View {
        NavigationStack {
            LearnDashboard()
                .navigationTitle("Learn")
                .accessibilityLabel("Learn more about the basics of Swift")
        }
    }
}


#Preview {
    LearnView()
        .environment(Settings())
}

struct LearnDashboard: View {
    
    let headerID: Int = 4001
    
    @State private var buttonJump: Bool = false
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .bottom) {
                ScrollView(.vertical) {
                    LazyVStack {
                        
                        ReadDisclaimer()
                            .id(headerID)
                            .onAppear {
                                buttonJump.toggle()
                            }
                            .onDisappear {
                                buttonJump = false
                            }
                        
                        ForEach(LearnRouter.sampleData, id: \.id) { item in
                            NavigationLink(value: item) {
                                MediumCard(cardTitle: item.cardTitle, imageName: item.imageName, byOrder: item.byOrder)
                            }
                        }
                    }
                    .navigationDestination(for: LearnRouter.self) { item in
                        routingLearn(item)
                    }
                    .padding(.bottom)
                    .buttonStyle(.plain)
                    
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        proxy.scrollTo(headerID)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        proxy.scrollTo(headerID)
                    }
                }, label: {
                    Image(systemName: "chevron.up")
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color(.systemGray6))
                        .opacity(0.8)
                        .clipShape(Circle())
                    
                    
                })
                .opacity(buttonJump ? 0 : 1)
                .buttonStyle(.plain)
                .padding(.bottom, 5)
            }
        }
    }
}

struct ReadDisclaimer: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            GroupBoxCard(description: "Please read the Disclaimer before using the app.")
                .font(.headline)
//                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
        }
    }
}

