//
//  CategoriesExploreViewController.swift
//  TuDumm
//
//  Created by Pedro Franco on 30/05/23.
//

import UIKit

class CategoriesExploreViewController: UIViewController {
        
    let categories = [
        Categories(image: UIImage(named: "1")!, genreTittle: "Originals"),
        Categories(image: UIImage(named: "2")!, genreTittle: "Drama"),
        Categories(image: UIImage(named: "3")!, genreTittle: "Comedy"),
        Categories(image: UIImage(named: "4")!, genreTittle: "Scy-Fi"),
        Categories(image: UIImage(named: "5")!, genreTittle: "Action"),
        Categories(image: UIImage(named: "6")!, genreTittle: "Adventure"),
        Categories(image: UIImage(named: "7")!, genreTittle: "Family"),
        Categories(image: UIImage(named: "8")!, genreTittle: "Animation"),
        Categories(image: UIImage(named: "9")!, genreTittle: "Documentary"),
        Categories(image: UIImage(named: "10")!, genreTittle: "Suspense"),
        Categories(image: UIImage(named: "11")!, genreTittle: "Horror"),
        Categories(image: UIImage(named: "12")!, genreTittle: "Policy"),
        Categories(image: UIImage(named: "13")!, genreTittle: "Romance"),
        Categories(image: UIImage(named: "14")!, genreTittle: "Fantasy"),
        Categories(image: UIImage(named: "15")!, genreTittle: "Anime"),
        Categories(image: UIImage(named: "16")!, genreTittle: "Brazilian")
    ]

    var item = ""
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension CategoriesExploreViewController: UICollectionViewDataSource {
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
                
        item = categories[indexPath.item].genreTittle
        
        print(item)
        
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SegmentedView") as? SearchExploreViewController
        
        nextViewController?.prepareSegue = item
        
        print(item)
        
        navigationController?.pushViewController(nextViewController!, animated: true)
        
    }
}

extension CategoriesExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 95)
    }
}
