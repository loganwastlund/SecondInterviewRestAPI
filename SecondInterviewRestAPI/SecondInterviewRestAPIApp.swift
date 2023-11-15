//
//  SecondInterviewRestAPIApp.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import SwiftUI

@main
struct SecondInterviewRestAPIApp: App {
    
    var body: some Scene {
        WindowGroup {
            OrdersView(ordersVM: OrdersViewModel())
        }
    }
}

// TODO: make list view of all orders
// TODO: make functionality to change count of orders grabbed
// TODO: functionality to sort and filter
// TODO: error handling with api errorMessage
// TODO: add detail screen where you can see all purchaser info and item details for that order
