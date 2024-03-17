//
//  SwiftUIModifyingProgramState.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 17.3.24..
//

import SwiftUI

struct SwiftUIModifyingProgramState: View {
    
   @State private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    SwiftUIModifyingProgramState()
}
