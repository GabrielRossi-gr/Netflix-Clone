//
//  HomeMovieTableViewCell.swift
//  TuDumm
//
//  Created by Cassiano C Salgado on 29/05/23.
//

import UIKit

class HomeMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var homeGenreTitle: UILabel!
    @IBOutlet weak var homeMovieColletionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeMovieColletionView.delegate = self
        homeMovieColletionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data[homeMovieColletionView.tag - 1].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieIcon", for: indexPath) as! HomeMovieCollectionViewCell
        
        cell.movieImageView.image = UIImage(named: data[homeMovieColletionView.tag - 1].movies[indexPath.row])
        
        return cell
    }
}
