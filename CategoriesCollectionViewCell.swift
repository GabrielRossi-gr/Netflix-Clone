//
//  CategoriesCollectionViewCell.swift
//  TuDumm
//
//  Created by Pedro Franco on 30/05/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categorieImage: UIImageView!
            
    public func setupCategories(with categorie: Categories) {
        categorieImage.image = categorie.image
    }
    
}
