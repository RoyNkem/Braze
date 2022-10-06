//
//  NetworkingManager.swift
//  Braze
//
//  Created by Roy Aiyetin on 05/10/2022.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknowm
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥]Bad response from URL: \(url)"
            case .unknowm: return "[⚠️]unknown error occurred"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap {try handleURLResponse(output: $0, url: url)}
            .receive(on: DispatchQueue.main) //return ton the main thread
            .eraseToAnyPublisher() //converts the publisher into an AnyPublisher type (which is our function return type
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
