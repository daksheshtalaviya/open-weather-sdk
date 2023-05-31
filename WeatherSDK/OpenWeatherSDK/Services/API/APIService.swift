//
//  APIService.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct APIService {
    
    var manager: URLSession = {
        let configuration: URLSessionConfiguration = .default
        
        let defaultHeaders = URLSession.shared.configuration.httpAdditionalHeaders
        configuration.httpAdditionalHeaders = defaultHeaders
        
        return URLSession(configuration: configuration)
    }()
    
    /// Fetches an object from the API.
    /// - Parameters:
    ///   - request: An `APIRequest` object containing the request details.
    ///   - completion: A closure that will be called upon completion of the request. It receives a Result object containing either the decoded object of type `T` or an `Error` in case of failure.
    ///
    /// - Important: The object type `T` must conform to the `Codable` protocol for successful decoding.
    ///
    func getObject<T: Codable>(request: APIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard !OpenWeatherSDK.apiKey.isEmpty else { fatalError("Please provide valid API key.") }

        DKLog.log()
                
        guard let r = try? request.asURLRequest() else { return }
        manager.dataTask(with: r) { data, response, error in
            if let error {
                DKLog.log("\n❌ error: \(error)")
                completion(.failure(error))
            } else if let data,
                      let statusCode = (response as? HTTPURLResponse)?.statusCodeEnum
            {
                if statusCode.isSuccess {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        dump("✅ success:")
                        dump(model)
                        completion(.success(model))
                    } catch let eError {
                        DKLog.log("\n❌ eError: \(eError)")
                        completion(.failure(eError))
                    }
                } else {
                    do {
                        let model = try JSONDecoder().decode(APIFailureResponse.self, from: data)
                        dump("❌ error:")
                        dump(model)
                        completion(.failure(APIError.ErrorModel.failure(model)))
                    } catch let eError {
                        DKLog.log("\n❌ eError: \(eError)")
                        completion(.failure(eError))
                    }
                }
            }
        }
        .resume()
    }
}

