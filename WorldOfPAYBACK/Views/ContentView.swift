//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Jakub Kuciński on 23/02/2024.
//

import SwiftUI

struct ContentView: View {
    let transactions = DataManager.shared.loadTransactions()
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedCategory, label: Text("Select Category")) {
                    Text("All").tag(0)
                    Text("Category 1").tag(1)
                    Text("Category 2").tag(2)
                    Text("Category 3").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TransactionListView(transactions: transactions, selectedCategory: selectedCategory)
                    .padding()
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemGray6).ignoresSafeArea())
        }
    }
}


#Preview {
    ContentView()
}
