//
//  NetworkManager.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 25.08.2022.
//

import Foundation

enum Link {
    static let url = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case noNetwork
    case decodingError
}

protocol NetworkManagerImplementation {
    func fetchData(from url: String?, with completion: @escaping(Result<Company, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerImplementation {
    
    func fetchData(from url: String?, with completion: @escaping(Result<Company, NetworkError>) -> Void) {
        
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let company = try JSONDecoder().decode(Company.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(company))
                }
            } catch {
                completion(.failure(.decodingError))
            }

        }.resume()
    }
    
}
