//
//  SwiftUINavigationBar.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 15.3.24..
//

import SwiftUI

struct SwiftUINavigationBar: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello world")
                    Text("Hello world")
                }
                Section {
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                }
                Section {
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                }
                Section {
                    Text("Hello world")
                    Text("Hello world")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SwiftUINavigationBar()
}
