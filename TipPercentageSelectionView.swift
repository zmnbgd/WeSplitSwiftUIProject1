//
//  TipPercentageSelectionView.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 2.4.24..
//

import SwiftUI

struct TipPercentageSelectionView: View {
    @Binding var tipPercentage: Int
       
       var body: some View {
           Form {
               Section(header: Text("Tip percentage")) {
                   Picker("Tip percentage", selection: $tipPercentage) {
                       ForEach(0..<101) { percentage in
                           Text("\(percentage)%")
                       }
                   }
                   .pickerStyle(.inline)
               }
           }
           .navigationTitle("Select Tip Percentage")
       }
   }

//#Preview {
//    TipPercentageSelectionView()
//}
