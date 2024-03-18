//
//  SwiftUIBindingStateToUserInterfaceControls.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 18.3.24..
//

import SwiftUI

struct SwiftUIBindingStateToUserInterfaceControls: View {
    
   @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter yout name", text: $name)
            Text("Hello \(name)")
        }
    }
}

#Preview {
    SwiftUIBindingStateToUserInterfaceControls()
}
