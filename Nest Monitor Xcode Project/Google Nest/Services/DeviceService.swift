//
//  DeviceService.swift
//  Google Nest
//
//

import Foundation

class DeviceService {
    
    func getDevices(completion: @escaping (GoogleNest?) -> ()) {
        guard let url = URL(string: "https://smartdevicemanagement.googleapis.com/v1/enterprises/\(projectID)/devices") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(googleUser.authentication.accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let orders = try? JSONDecoder().decode(GoogleNest.self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
        
    }
    
//    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?)->()) {
//
//        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
//            completion(nil)
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(order)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//                return
//            }
//
//            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
//            DispatchQueue.main.async {
//                completion(response)
//            }
//
//        }.resume()
//
//    }
    
}
