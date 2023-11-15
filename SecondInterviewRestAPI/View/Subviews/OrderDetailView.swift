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
                
                Form {
                    Section(header: Text("Items")) {
                        ForEach(order.items.indices, id: \.self) { index in
                            HStack {
                                Text("\(order.items[index].productName)")
                                
                                Spacer()
                                
                                Text("\(order.items[index].costString())")
                            }
                        }
                    }
                    
                    Section(header: Text("Purchaser Info"), footer: Text("ID: \(order.purchaser.id)")) {
                        Text("Name: \(order.purchaser.name)")
                        
                        Text("Email: \(order.purchaser.email)")
                        
                        Text("Phone Number: \(order.purchaser.phoneNumber)")
                        
                        Text("Address: \(order.purchaser.address)")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
