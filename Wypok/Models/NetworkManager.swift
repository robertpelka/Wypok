//
//  NetworkManager.swift
//  Wypok
//
//  Created by Robert Pelka on 02/01/2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var hits = [Hit]()
    
    func fetchData() {
        if let url = URL(string: "https://a2.wykop.pl/Hits/Day/appkey/dn0ZqFMbc3") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Hits.self, from: safeData)
                            DispatchQueue.main.async {
                                self.hits = results.data
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
                else {
                    print(error!)
                }
            }
            task.resume()
        }
    }
}
