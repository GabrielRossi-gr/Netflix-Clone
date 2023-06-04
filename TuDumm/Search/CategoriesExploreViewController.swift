//
//  CategoriesExploreViewController.swift
//  TuDumm
//
//  Created by Pedro Franco on 30/05/23.
//

import UIKit

class CategoriesExploreViewController: UICollectionViewCell {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    extension SearchExploreViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            
            cell.setupCategories(with: categories[indexPath.row])
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // Lógica para lidar com o clique na célula selecionada
            let selectedCell = indexPath.item
            
            if (selectedCell == 0) {
                print("000")
                // self.navigationController?.pushViewController(FilterViewController(), animated: true)
                
            }
        }
        
    }

    extension SearchExploreViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 174, height: 95)
        }
    }

}
