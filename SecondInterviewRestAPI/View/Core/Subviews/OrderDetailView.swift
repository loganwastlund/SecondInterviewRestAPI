//
//  OrderDetailView.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import SwiftUI

struct OrderDetailView: View {
    
    let order: Order
    
    var body: some View {
        ZStack {
            
            VStack {
                orderDetails
                
                Form {
                    itemsSection
                    
                    purchaserInfoSection
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension OrderDetailView {
    
    var purchaserInfoSection: some View {
        Section(header: Text("Purchaser Info"), footer: Text("ID: \(order.purchaser.id)")) {
            Text("Name: \(order.purchaser.name)")
            
            Text("Email: \(order.purchaser.email)")
            
            Text("Phone Number: \(order.purchaser.phoneNumber)")
            
            Text("Address: \(order.purchaser.address)")
        }
    }
    
    var itemsSection: some View {
        Section(header: Text("Items")) {
            ForEach(order.items) { item in
                VStack {
                    HStack {
                        Text(item.productName)
                        
                        Spacer()
                        
                        Text(item.costString())
                    }
                    
                    Text(item.id)
                        .font(.caption)
                }
            }
        }
    }
    
    var orderDetails: some View {
        Group {
            Text("Order ID")
            
            Text(order.id)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding(.bottom)
            
            HStack {
                Text("Total Cost: \(order.totalCostOfItemsString())")
                
                Spacer()
                
                Text("Number of items: \(order.items.count)")
            }
            .padding(.horizontal)
        }
        .font(.callout)
        .padding(.horizontal)
    }
}
