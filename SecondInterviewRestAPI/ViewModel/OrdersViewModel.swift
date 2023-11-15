//
//  OrdersViewModel.swift
//  SecondInterviewRestAPI
//
//  Created by Logan on 11/15/23.
//

import Foundation

final class OrdersViewModel: ObservableObject {
    
    @Published var orders: [Order]?
    
    @Published var sortOption: SortOption = .none
    @Published var sortAscending: Bool = true
    
    enum SortOption: String, CaseIterable {
        case none = "None"
        case items = "Items"
        case totalCost = "Cost"
    }
    
    init() {
        Task {
            await self.getOrders(count: 50)
        }
    }
    
    func getOrders(count: Int) async { // async means it will run on background thread
        if let url = URL(string: "https://dtmad-store.up.railway.app/api/v1/orders/?count=\(count)") {
            var request = URLRequest(url: url)
            request.setValue("UndYxaTF7VnzVGQRYjAvzgtwvKXbrbBrDtZ5KQQbj0j6GXW1BU1BRk7aTrcvATHu", forHTTPHeaderField: "X-Api-Key")
            request.httpMethod = "GET"
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                do {
                    if let data {
                        let orderResponse = try JSONDecoder().decode(OrderResponse.self, from: data)
                        
                        DispatchQueue.main.sync {
                            self.orders = orderResponse.results
                        }
                    }
                    
                    if let response {
                        print(response)
                    }
                    
                    if let error {
                        print(error.localizedDescription)
                    }
                } catch {
                    print("Error decoding OrderResponse from JSON: \(error)")
                }
            }
            dataTask.resume()
        }
    }
}
