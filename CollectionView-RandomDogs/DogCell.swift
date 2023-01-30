//
//  DogCell.swift
//  CollectionView-RandomDogs
//
//  Created by Brendon Crowe on 1/30/23.
//

import UIKit
import ImageKit

class DogCell: UICollectionViewCell {
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    public func configureCell(with dogImage: DogImage) {
        dogImageView.getImage(with: dogImage) { [weak self] result in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.dogImageView.image = UIImage(systemName: "eclamationmark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.dogImageView.image = image
                    
                }
            }
        }
    }
}
