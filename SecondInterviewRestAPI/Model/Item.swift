//
//  Item.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: String
    let productName: String
    let cost: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case cost
    }
}
