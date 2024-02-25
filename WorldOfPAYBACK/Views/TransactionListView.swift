//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by Jakub Kuciński on 23/02/2024.
//
import SwiftUI

struct TransactionListView: View {
    let transactions: [Transaction]
    let selectedCategory: Int
    
    var filteredTransactions: [Transaction] {
        if selectedCategory == 0 {
            return transactions
        } else {
            return transactions.filter { $0.category == selectedCategory }
        }
    }
    
    var totalAmount: Int {
        return filteredTransactions.reduce(0) { $0 + $1.transactionDetail.value.amount }
    }
    
    var body: some View {
        List(filteredTransactions) { transaction in
            NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Date: \(formattedDate(transaction.transactionDetail.bookingDate))")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Text("Partner: \(transaction.partnerDisplayName)")
                        .foregroundColor(.black)
                    if let description = transaction.transactionDetail.description {
                        Text("Description: \(description)")
                            .foregroundColor(.black)
                    }
                    Text("Amount: \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                        .foregroundColor(.green)
                }
            }
            .padding(.vertical, 8)
        }
        .listStyle(PlainListStyle())
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .padding()
        .navigationBarItems(trailing:
                                Text("Total: \(totalAmount)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.red))
    }
    
    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return ""
    }
}
