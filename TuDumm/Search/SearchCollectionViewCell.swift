//
//  SearchCollectionViewCell.swift
//  TuDumm
//
//  Created by Pedro Franco on 30/05/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewCell: UIImageView!
    
    public func setupTrending(with movie: Movie) {
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)") {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
                if let error = error {
                    print("Erro ao carregar a imagem: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageViewCell.image = image
                    }
                }
            }.resume()
        } else {
            print("URL da imagem inválida: \(movie.poster_path)")
        }
    }
    
    public func setupFilm(with movie: Films) {
        imageViewCell.image = movie.image
    }
    public func setupSeries(with movie: Series) {
        imageViewCell.image = movie.image
    }
}
