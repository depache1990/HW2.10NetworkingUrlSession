//
//  NetworkingManager.swift
//  HW2.10NetworkingUrlSession
//
//  Created by Anton Duplin on 3/7/22.
//

import Foundation
class NetworkManager{
    
        
        static let shared = NetworkManager()
        
        private init() {}
       
    func fetchData(_ completion: @escaping (_ dateTime: [Date]) -> ()) {
            
            let jsonURL = URLS.dateTime.rawValue
            guard let url = URL(string: jsonURL) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error { print(error.localizedDescription); return }
                guard let data = data else { return }
                
                do {
                    let currencyRates = try JSONDecoder().decode([Date].self, from: data)
                    DispatchQueue.main.async {
                        completion(currencyRates)
                    }
                    
                } catch let jsonError {
                    print(jsonError)
                }
            }.resume()
        }
        
        
    
}
