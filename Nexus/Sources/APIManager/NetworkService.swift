//
//  APIManager.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

enum NetworkError: Error {
    case badData
    case badResponse
    case badRequest
    case badDecode
    case badEncode
    case unknown(String)
}

protocol NetworkProtocol {
    func fetchData<T: Codable>(
        url: URL,
        body: Encodable?,
        headers: [String: String]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

final class NetworkService: NetworkProtocol {
    func fetchData<T>(url: URL, body: Encodable?, headers: [String : String]?, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        <#code#>
    }
    
    
}
