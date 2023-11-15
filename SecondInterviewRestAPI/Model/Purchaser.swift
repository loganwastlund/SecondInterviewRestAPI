//
//  Purchaser.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

struct Purchaser: Codable, Identifiable {
    let id: String
    let name: String
    let address: String
    let phoneNumber: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case phoneNumber = "phone_number"
        case email = "email_address"
    }
}
