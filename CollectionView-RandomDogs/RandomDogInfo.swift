//
//  RandomDogInfo.swift
//  CollectionView-RandomDogs
//
//  Created by Brendon Crowe on 1/30/23.
//

import Foundation

typealias DogImage = String

struct RandomDogInfo: Decodable {
    let message: [DogImage]
}
