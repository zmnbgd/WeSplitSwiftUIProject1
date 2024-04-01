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
         let peopleCount = Double(numberOfPeople + 2)
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
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("tip value, without dividing by the number of people") {
                    
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
