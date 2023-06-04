//
//  ModallyViewController.swift
//  TuDumm
//
//  Created by Pedro Franco on 31/05/23.
//

import UIKit

class ModallyViewController: UIViewController {
    
    @IBOutlet var trailerButtons: [UIButton]!
    @IBOutlet weak var dowloadButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var typeOutlet: UILabel!
    @IBOutlet weak var tittleOutlet: UILabel!
    @IBOutlet weak var yearOutlet: UILabel!
    @IBOutlet weak var ageGroupOutlet: UILabel!
    @IBOutlet weak var seasonsOrEpisodeOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var castOutlet: UILabel!
    
    
    /// Series
    var modallyImageView: UIImage = UIImage()
    var modallyTypeTittle: String = ""
    var modallyTittleSerie: String = ""
    var modallyYearData: Int = 0
    var modallyAgeGroupType: String = ""
    var modallySeasonsOrEpisodes: String = ""
    var modallyDescriptionForSerie: String = ""
    var modallyCastSerie: String = ""
    
    /// Movies
    var modallyImageViewMovie: UIImage = UIImage()
    var modallyTypeTittleMovie: String = ""
    var modallyTittleSerieMovie: String = ""
    var modallyYearDataMovie: Int = 0
    var modallyAgeGroupTypeMovie: String = ""
    var modallySeasonsOrEpisodesMovie: String = ""
    var modallyDescriptionForSerieMovie: String = ""
    var modallyCastSerieMovie: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in trailerButtons {
            i.tintColor = .darkGray
            i.titleLabel?.textColor = .white
            
            i.layer.cornerRadius = 0.5 * i.bounds.size.width
            i.clipsToBounds = true
        }
        
        playButton.tintColor = .white
        playButton.titleLabel?.textColor = .black
        dowloadButton.tintColor = .darkGray
        
//            print("Depois :: \(modallyImageView)")
//            print("Depois :: \(modallyTypeTittle)")
//            print("Depois :: \(modallyTittleSerie)")
//            print("Depois :: \(modallyYearData)")
//            print("Depois :: \(modallyAgeGroupType)")
//            print("Depois :: \(modallySeasonsOrEpisodes)")
//            print("Depois :: \(modallyDescriptionForSerie)")
//            print("Depois :: \(modallyCastSerie)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if change == 1 {
            imageOutlet.image = modallyImageView
            typeOutlet.text = modallyTypeTittle
            tittleOutlet.text = modallyTittleSerie
            yearOutlet.text = String(modallyYearData)
            ageGroupOutlet.text = modallyAgeGroupType
            seasonsOrEpisodeOutlet.text = modallySeasonsOrEpisodes
            descriptionOutlet.text = modallyDescriptionForSerie
            castOutlet.text = modallyCastSerie
        }
        else if change == 0 {
            imageOutlet.image = modallyImageViewMovie
            typeOutlet.text = modallyTypeTittleMovie
            tittleOutlet.text = modallyTittleSerieMovie
            yearOutlet.text = String(modallyYearDataMovie)
            ageGroupOutlet.text = modallyAgeGroupTypeMovie
            seasonsOrEpisodeOutlet.text = modallySeasonsOrEpisodesMovie
            descriptionOutlet.text = modallyDescriptionForSerieMovie
            castOutlet.text = modallyCastSerieMovie
        } else {
            return
        }
    }
}
