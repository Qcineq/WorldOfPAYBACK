//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by Jakub Kuciński on 23/02/2024.
//

import Foundation

struct Transaction: Codable, Identifiable {
    let id = UUID()
    let partnerDisplayName: String
    let category: Int
    let transactionDetail: TransactionDetail
}

struct TransactionDetail: Codable {
    let description: String?
    let bookingDate: String
    let value: Value
}

struct Value: Codable {
    let amount: Int
    let currency: String
}

