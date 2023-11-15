//
//  Order.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

struct Order: Codable, Equatable, Hashable, Identifiable {
    let id: String
    let items: [Item]
    let purchaser: Purchaser
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Order, rhs: Order) -> Bool {
        lhs.id == rhs.id
    }
    
    func totalCostOfItemsString() -> String {
        "$\(String(format:"%.2f", self.items.totalCost()))"
    }
}
