//
//  OrdersView.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import SwiftUI

struct OrdersView: View {
    
    @StateObject var ordersVM: OrdersViewModel
    @State var navPath = NavigationPath()
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ZStack {
                VStack {
                    if let _ = ordersVM.orders {
                        HStack {
                            Menu {
                                ForEach(OrdersViewModel.SortOption.allCases, id: \.self) { sortOption in
                                    Button {
                                        ordersVM.sortOption = sortOption
                                    } label: {
                                        Text(sortOption.rawValue)
                                    }
                                }
                            } label: {
                                Text("Sort by: \(ordersVM.sortOption.rawValue)")
                            }
                            
                            Button {
                                ordersVM.sortAscending.toggle()
                            } label: {
                                Image(systemName: "arrow.up.arrow.down.square")
                            }
                            .disabled(ordersVM.sortOption == .none)
                        }

                        ordersList
                    } else {
                            Text("Loading orders...")
                            ProgressView()
                    }
                }
            }
            .navigationTitle("Orders")
            .navigationDestination(for: Order.self) { order in
                OrderDetailView(order: order)
            }
        }
    }
}

extension OrdersView {
    
    var ordersList: some View {
        List {
            ForEach(searchResults.sort(by: ordersVM.sortOption, asending: ordersVM.sortAscending)) { order in
                OrderRowView(order: order)
            }
        }
        .listRowSpacing(Constants.Spacing.ListRowSpacing)
        .searchable(text: $searchText)
    }
    
    var searchResults: [Order] {
        if let orders = ordersVM.orders {
            if searchText.isEmpty {
                return orders
            } else {
                return orders.filter { order in
                    for item in order.items {
                        if item.productName.contains(searchText) {
                            return true
                        }
                    }
                    
                    if order.purchaser.name.contains(searchText) {
                        return true
                    } else if order.purchaser.address.contains(searchText) {
                        return true
                    } else if order.purchaser.email.contains(searchText) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        return []
    }
}

private struct OrderRowView: View {
    
    let order: Order
    
    var body: some View {
        NavigationLink(value: order) {
            VStack(alignment: .leading) {
                HStack {
                    Text(order.totalCostOfItemsString())
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text("Items: \(order.items.count)")
                        .font(.headline)
                }
                
                Divider()
                
                purchaserInfoRow(infoTitle: "Name", value: order.purchaser.name)
                
                Divider()
                
                purchaserInfoRow(infoTitle: "Email", value: order.purchaser.email)
                
                Divider()
                
                purchaserInfoRow(infoTitle: "Address", value: order.purchaser.address)
                    .lineLimit(2)
            }
            .lineLimit(1)
            .font(.footnote)
        }
    }
    
    func purchaserInfoRow(infoTitle: String, value: String) -> some View {
        HStack {
            Text(infoTitle + ":")
            
            Text(value)
        }
    }
}
