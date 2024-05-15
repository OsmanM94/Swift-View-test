//
//  FrameAlignment.swift
//  Swift View
//
//  Created by asia on 21/03/2024.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func alignment(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}
