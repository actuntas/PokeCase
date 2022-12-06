//
//  NetworkError.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidCredentials = "Invalid Credentials"
    case invalidRequest = "Invalid Request"
    case invalidData = "Invalid Data"
    case invalidResponse = "Invalid Response"
}
