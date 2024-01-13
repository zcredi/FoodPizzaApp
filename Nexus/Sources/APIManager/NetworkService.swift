//
//  APIManager.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

public enum NetworkError: Error {
    case badData
    case badResponse
    case badRequest
    case badDecode
    case badEncode
    case unknown(String)
}

public protocol NetworkProtocol {
    func fetchData<T: Codable>(
        url: URL,
        method: String,
        body: Encodable?,
        headers: [String: String]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

public final class NetworkService: NetworkProtocol {
    //MARK: - init(_:)
    public init() {}
    
    public func fetchData<T: Codable>(
        url: URL,
        method: String = "GET",
        body: Encodable? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers?.forEach { request.addValue($1, forHTTPHeaderField: $0) }

        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                completion(.failure(.badEncode))
                return
            }
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    completion(.failure(.badResponse))
                    return
                }

                guard let data = data else {
                    completion(.failure(.badData))
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.badDecode))
                }
            }
        }.resume()
    }
}

//MARK: - extension NetworkProtocol
public extension NetworkProtocol {
    func fetchData<T: Codable>(
        url: URL,
        method: String = "GET",
        body: Encodable? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        fetchData(url: url, method: method, body: body, headers: headers, completion: completion)
    }
}
