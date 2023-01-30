//
//  DogAPIClient.swift
//  CollectionView-RandomDogs
//
//  Created by Brendon Crowe on 1/30/23.
//

import Foundation
import NetworkHelper


struct DogAPIClient {
    static func fetchDogs(completion: @escaping (Result<[DogImage], AppError>) ->()) {
        let endpointURLString = "https://dog.ceo/api/breeds/image/random/50"
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { result in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(RandomDogInfo.self, from: data)
                    completion(.success(results.message))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
