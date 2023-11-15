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
            ZStack {
                if let orders = ordersVM.orders {
                    List {
                        ForEach(orders) { order in
                            OrderRowView(order: order)
                        }
                    }
                } else {
                    Text("Loading orders...")
                }
            }
            .navigationTitle("Orders")
        }
        .navigationDestination(for: Order.self) { order in
            Text(order.id)
        }
    }
}

private struct OrderRowView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack {
                Text("$\(String(format:"%.2f", order.items.totalCost()))")
                    .font(.title)
                
                Text("Items: \(order.items.count)")
                    .font(.headline)
            }
            .padding(.trailing)
            
            VStack(alignment: .leading) {                
                purchaserInfoRow(infoTitle: "Name", value: order.purchaser.name)
                
                Divider()
                
                purchaserInfoRow(infoTitle: "Email", value: order.purchaser.email)
                
                Divider()
                
                purchaserInfoRow(infoTitle: "Address", value: order.purchaser.address)
                    .lineLimit(2)
            }
            .lineLimit(1)
            .font(.caption)
            
            Spacer()
        }
    }
    
    func purchaserInfoRow(infoTitle: String, value: String) -> some View {
        HStack {
            Text(infoTitle + ":")
            
            Text(value)
        }
    }
}

#Preview {
    OrdersView(ordersVM: OrdersViewModel())
}
