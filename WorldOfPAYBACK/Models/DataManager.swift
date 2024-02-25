//
//  DataManager.swift
//  WorldOfPAYBACK
//
//  Created by Jakub Kuciński on 23/02/2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func loadTransactions() -> [Transaction] {
        if let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(TransactionResult.self, from: data)
                return result.items.sorted { $0.transactionDetail.bookingDate < $1.transactionDetail.bookingDate }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        return []
    }
}

struct TransactionResult: Codable {
    let items: [Transaction]
}
