//
//  Array + EXT.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

extension Array where Element == Item {
    
    func totalCost() -> Double {
        self.reduce(0) { $0 + $1.cost }
    }
}

extension Array where Element == Order {
    
    func sort(by sortOption: OrdersViewModel.SortOption, asending: Bool) -> [Order] {
        switch sortOption {
        case .none:
            return self
        case .items:
            if asending {
                return self.sorted { $0.items.count > $1.items.count }
            } else {
                return self.sorted { $0.items.count < $1.items.count }
            }
        case .totalCost:
            if asending {
                return self.sorted { $0.items.totalCost() > $1.items.totalCost() }
            } else {
                return self.sorted { $0.items.totalCost() < $1.items.totalCost() }
            }
        }
    }
}
