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
