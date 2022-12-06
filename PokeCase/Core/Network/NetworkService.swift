//
//  NetworkService.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

protocol NetworkService {
    func perform<Request: Requestable>(_ request: Request, completion: @escaping (Result<Request.Response, NetworkError>) -> Void)
}

final class DefaultNetworkService: NetworkService {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func perform<Request:Requestable>(_ request: Request, completion: @escaping (Result<Request.Response, NetworkError>) -> Void) {
        guard let urlRequest = try? request.createURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                return completion(.failure(.invalidRequest))
            }
            
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode, responseCode != 401 else {
                return completion(.failure(.invalidCredentials))
            }
            
            guard 200..<300 ~= responseCode else {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
}
