//
//  ContentView.swift
//  WeSplit
//
//  Created by Marko Zivanovic on 12.3.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var showingTipPercentageSelection = false
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        //MARK:
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalCheckAmount: Double {
         let tipSelection = Double(tipPercentage)
         let tipValue = checkAmount / 100 * tipSelection
         let totalAmountForCheck = checkAmount + tipValue
         
         return totalAmountForCheck
     }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(2..<101) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much you want to tip?") {
//                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(0..<101) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.automatic)
                    //MARK: Challenge 3. Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
                    NavigationLink(destination: TipPercentageSelectionView(tipPercentage: $tipPercentage)) {
                    Text("Select Tip Percentage")
                    }
                }
                //MARK: Challenge 1. Add a header to the third section, saying “Amount per person”
                Section("“Amount per person”") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                //MARK: Challenge 2. Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
                Section("Total amount including tip") {
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            
            .navigationTitle("We split")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false 
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
