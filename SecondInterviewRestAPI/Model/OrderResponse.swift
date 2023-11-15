//
//  OrderResponse.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

struct OrderResponse: Codable {
    let responseCode: Int
    let count: Int
    let errorMessage: String
    let results: [Order]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case count
        case errorMessage = "error_message"
        case results
    }
}
