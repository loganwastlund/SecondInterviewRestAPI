//
//  OrdersView.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import SwiftUI

struct OrdersView: View {
    
    @StateObject var ordersVM: OrdersViewModel
    
    var body: some View {
        NavigationStack {
            if let orders = ordersVM.orders {
                ScrollView {
                    ForEach(orders) { order in
                        OrderRowView(order: order)
                    }
                }
            } else {
                Text("Loading orders...")
            }
        }
        .navigationTitle("Orders")
        .navigationDestination(for: Order.self) { order in
            Text(order.id)
        }
    }
}

private struct OrderRowView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            Text("$\(String(format:"%.2f", order.items.totalCost()))")
                .font(.largeTitle)

            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    Text("Items: \(order.items.count)")
                        .font(.headline)
                }
                
                Group {
                    Text("Purchaser Info")
                        .font(.caption)
                    
                    Text("Name: \(order.purchaser.name)")
                    
                    Text("Email: \(order.purchaser.email)")
                    
                    Text("Address: \(order.purchaser.address)")
                }
                .font(.callout)
            }
        }
    }
}

#Preview {
    OrdersView(ordersVM: OrdersViewModel())
}
