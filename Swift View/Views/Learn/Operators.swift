//
//  OperatorsView.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import SwiftUI

struct Operators: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(Learn.operators, id: \.id) { item in
                    SmallCard(title: item.title, description: item.description, image: item.image)
                }
            
                OperatorsTable()

            }
        }
    }
}



struct OperatorsTable: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SectionView(title: "Arithmetic Operators in Swift", operators: Operator.arithmeticOperators)
            Spacer()
            SectionView(title: "Logical and Comparison Operators in Swift", operators: Operator.logicalComparisonOperators)
        }
        .padding()
    }
}

struct SectionView: View {
    let title: String
    let operators: [Operator]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            HStack {
                Text("Operator")
                    .fontWeight(.bold)
                Spacer()
                Text("Description")
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            .background(Color.gray.opacity(0.2))
            
            ForEach(operators, id: \.id) { op in
                OperatorRow(operators: op)
            }
        }
    }
}

struct OperatorRow: View {
    let operators: Operator
    
    var body: some View {
        HStack {
            Text(operators.symbol)
            Spacer()
            Text(operators.description)
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
    }
}

struct Operator: Identifiable, Hashable {
    var id: Int
    let symbol: String
    let description: String
}

extension Operator {
    static let arithmeticOperators: [Operator] = [
        Operator(
            id: 5001,
            symbol: "+",
            description: "Addition"
        ),
        Operator(
            id: 5002,
            symbol: "-",
            description: "Subtraction"
        ),
        Operator(
            id: 5003,
            symbol: "*",
            description: "Multiplication"
        ),
        Operator(
            id: 5004,
            symbol: "/",
            description: "Division"
        ),
        Operator(
            id: 5005,
            symbol: "%",
            description: "Remainder"
        ),
        Operator(
            id: 5006,
            symbol: "+=, -=, *=, /=, %=",
            description: "Assignment Operators"
        )
    ]
    
    static let logicalComparisonOperators: [Operator] = [
        Operator(
            id: 5007,
            symbol: "==",
            description: "Equal to"
        ),
        Operator(
            id: 5008,
            symbol: "!=",
            description: "Not equal to"
        ),
        Operator(
            id: 5009,
            symbol: ">",
            description: "Greater than"
        ),
        Operator(
            id: 5010,
            symbol: "<",
            description: "Less than"
        ),
        Operator(
            id: 5011,
            symbol: ">=",
            description: "Greater than or equal to"
        ),
        Operator(
            id: 5012,
            symbol: "<=",
            description: "Less than or equal to"
        ),
        Operator(
            id: 5013,
            symbol: "&&",
            description: "Logical AND"
        ),
        Operator(
            id: 5014,
            symbol: "||",
            description: "Logical OR"
        ),
        Operator(
            id: 5015,
            symbol: "!",
            description: "Logical NOT"
        )
    ]
}
