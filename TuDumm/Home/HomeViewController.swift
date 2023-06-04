//
//  HomeViewController.swift
//  TuDumm
//
//  Created by Cassiano C Salgado on 29/05/23.
//

import UIKit


var data = [
    MovieData(section: "Trending Now", movies: ["ze1", "ze3", "ze6", "fabio4", "ze8", "fabio10", "fabio7", "ze17"]),
    MovieData(section: "Movies", movies: ["fabio1", "fabio2", "fabio3", "fabio4", "fabio5", "fabio6", "fabio7", "fabio8"]),
    MovieData(section: "Series", movies: ["ze1", "ze2", "ze3", "ze4", "ze5", "ze6", "ze7", "ze8"]),
    MovieData(section: "Series and Movies", movies: ["fabio1", "fabio2", "fabio3", "fabio4", "fabio5", "fabio6", "fabio7", "fabio8", "fabio9", "fabio10", "fabio11", "fabio12", "fabio13", "fabio14", "fabio15", "fabio16", "fabio17", "fabio18"])
]

class HomeViewController: UIViewController {
    var bannerIn = false
    var bannerHightIn = false
    let gradient = CAGradientLayer()
    let bgColorView = UIView()

    @IBOutlet weak var homeGenreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient.frame = view.bounds
        gradient.frame.size.height = CGFloat(200)
        gradient.colors = [UIColor(red: 210/255, green: 203/255, blue: 75/255, alpha: 1).cgColor, UIColor.black.cgColor]
        bgColorView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        view.layer.insertSublayer(gradient, at: 0)

    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 491
        }
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if bannerIn == false {
            let cell = homeGenreTableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! HomeBannerTableViewCell
            
            cell.bannerImageView.image = UIImage(named: "ShrekBanner")
            
            cell.bannerGenreLabel.text = "Animação • Comédia • Infântil"
                        
            cell.selectedBackgroundView = bgColorView

            bannerIn = true
            
            return cell

        }
        
        let cell = homeGenreTableView.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath) as! HomeMovieTableViewCell
        
        cell.selectedBackgroundView = bgColorView

        cell.homeMovieColletionView.tag = indexPath.section
        
        cell.homeGenreTitle.text = data[indexPath.section - 1].section
        
        return cell
    }

}
