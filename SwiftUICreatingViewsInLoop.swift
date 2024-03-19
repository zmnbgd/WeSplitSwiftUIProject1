//
//  SwiftUICreatingViewsInLoop.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 19.3.24..
//

import SwiftUI

struct SwiftUICreatingViewsInLoop: View {
    
    //@State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                //            ForEach(0..<100) { number in
                //                Text("Row \(number)")
                //            }
                //MARK: A different way
                //            ForEach(0..<100) {
                //                Text("Row \($0)")
                //            }
                Picker("Selected your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    SwiftUICreatingViewsInLoop()
}
