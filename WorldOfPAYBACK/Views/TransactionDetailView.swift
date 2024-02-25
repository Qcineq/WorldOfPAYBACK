//
//  TransactionDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Jakub Kuciński on 23/02/2024.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Partner: \(transaction.partnerDisplayName)")
                .font(.title)
                .foregroundColor(.blue)
            if let description = transaction.transactionDetail.description {
                Text("Description: \(description)")
                    .foregroundColor(.black)
            }
            Text("Amount: \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                .foregroundColor(.green)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .navigationBarTitle("Transaction Detail", displayMode: .inline)
    }
}
