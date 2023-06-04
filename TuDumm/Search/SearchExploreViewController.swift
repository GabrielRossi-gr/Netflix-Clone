//
//  SearchExploreViewController.swift
//  TuDumm
//
//  Created by Cassiano C Salgado on 30/05/23.
//

import UIKit

var films: [Movie] = []

var change = 0

let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
let titleTextNormal = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]

class SearchExploreViewController: UIViewController {
    let series = [
        Series(banner: UIImage(named: "banner1")!, image: UIImage(named: "ze1")!, type: "Serie", tittle: "Emily in Paris", year: 2020, ageGroup: "14", seasons: "3 Seasons", description: "Emily brings her can-do American attitude and fresh ideas to her new office in Paris, but her inability to speak French turns out to be a mahor faux pas.", cast: "Lily Collins, Philippine Leroy-Beaulieu, Shley Park."),
        Series(banner: UIImage(named: "banner2")!, image: UIImage(named: "ze2")!, type: "Serie", tittle: "A Quest for a an Iron Legend", year: 2022, ageGroup: "AL", seasons: "3 Seasons", description: "Secret ingredients. Thight time frames. Now bring the heart, deliciousness and sheer creativity to the table. Tha's all it takes to beat an Iron Chef.", cast: "Alton Brown, Kristen Kish and Mark Dacascos."),
        Series(banner: UIImage(named: "banner3")!, image: UIImage(named: "ze3")!, type: "Serie", tittle: "Breaking Bed", year: 2013, ageGroup: "16", seasons: "5 Seasons", description: "Diagnosed with terminal lung cancer, a high school chemistry teacher resorts to cooking and selling methamphetamine to provide for his family.", cast: "Bryan Cranston, Aaron Paul, Anna Gunn, Dean Norris."),
        Series(banner: UIImage(named: "banner4")!, image: UIImage(named: "ze4")!, type: "Serie", tittle: "Money Heist", year: 2021, ageGroup: "16", seasons: "5 Seasons", description: "Tamayo's breaches of protocol surprise the Professor. Bogotá calms Denver's anxieties. With time running out, Palermo initiates the plan.", cast: "Úrsula Corbeiró, Álvaro Morte, Itziar Ituno, Padro Alonso, Miguel Herrán."),
        Series(banner: UIImage(named: "banner5")!, image: UIImage(named: "ze5")!, type: "Serie", tittle: "New Amsterdam", year: 2018, ageGroup: "12", seasons: "5 Seasons", description: "Dr. Max Goodwin is brilliant, charming -- and the new medical director at America's oldest public hospital.", cast: "Ryan Eggold, Janet Montgomery, Jocko Sims, Tyler Labine, Freema Agyeman."),
        Series(banner: UIImage(named: "banner6")!, image: UIImage(named: "ze6")!, type: "Serie", tittle: "Tribes of Europa", year: 2021, ageGroup: "16", seasons: "6 Episodes", description: "In post-apocalyptic Europe, amid wars among microstates, three siblings fight for survival as a greater threat looms over the continent.", cast: "Henriette Confurius, Emilio Sakrayo, David Ali Rashed, Oliver Masucci."),
        Series(banner: UIImage(named: "banner7")!, image: UIImage(named: "ze7")!, type: "Serie", tittle: "Anne with an E", year: 2019, ageGroup: "12", seasons: "3 Seasons", description: "A plucky orphan whose passions run deep finds an unlikely home with a spinster and her soft-spoken bachelor brother.", cast: "Amybeth McNulty, Geraldine Hames, R.H. Thomson, Corrine Koslo"),
        Series(banner: UIImage(named: "banner8")!, image: UIImage(named: "ze8")!, type: "Serie", tittle: "Ginny & Georgia", year: 2023, ageGroup: "16", seasons: "2 Seasons", description: "They're in a new state. They're seeking a fresh start. But Ginny and Georgia find that wherever they go, there they are.", cast: "Brianne Howey, Antonia Gentry, Diesel La Torraca, Jennifer Robertson."),
        Series(banner: UIImage(named: "banner9")!, image: UIImage(named: "ze9")!, type: "Serie", tittle: "Behind Her Eyes", year: 2021, ageGroup: "16", seasons: "6 Episodes", description: "Simona Brown and Eve Hewson star in this twisty thriller with an ending so wild it inspired its own hashtag.", cast: "Simona Brown, Eve Hewson, Tom Bateman."),
        Series(banner: UIImage(named: "banner10")!, image: UIImage(named: "ze10")!, type: "Serie", tittle: "Peaky Blinders", year: 2022, ageGroup: "16", seasons: "6 Seasons", description: "A notorius gang in 1919 Birmingham, ENgland, is led by the fierce Tommy Shelby, a crime boss set on moving up in the world no matter the cost.", cast: "Cillian Murphy, Sam Neil, Helen McCrory."),
        Series(banner: UIImage(named: "banner11")!, image: UIImage(named: "ze11")!, type: "Serie", tittle: "Brooklyn nine-nine", year: 2021, ageGroup: "14", seasons: "8 Seasons", description: "Brillian but immature Brooklyn detective Jake Peralta must learn to follow the rules and be a team player when his squad gets an exactling new captain.", cast: "Andy Samberg, Andre Braugher, Stephanie Beatriz."),
        Series(banner: UIImage(named: "banner12")!, image: UIImage(named: "ze12")!, type: "Serie", tittle: "The Last Kingdom", year: 2022, ageGroup: "16", seasons: "5 Seasons", description: "As Alfred the Great defends his kingdom from Norse invaders, Uhtred -- born a Saxon but raised by Vikings -- seeks to claim his ancestral birthright.", cast: "Alexander Dreymon, Emily Cox, David Dawson."),
        Series(banner: UIImage(named: "banner13")!, image: UIImage(named: "ze13")!, type: "Serie", tittle: "Lucifer", year: 2021, ageGroup: "14", seasons: "6 Seasons", description: "Bored with being the Lord of Hell the devil relocates to Los Angeles, where he opens a nightclub and forms a connection with a homicide detective.", cast: "Tom Ellis, Lauren German, Kevin Alejandro."),
        Series(banner: UIImage(named: "banner14")!, image: UIImage(named: "ze14")!, type: "Serie", tittle: "Snowflake Mountain", year: 2022, ageGroup: "14", seasons: "8 Episodes", description: "Sometimes you just wanna laugh at people who have asolutely no clue what they're doing. Don't fell bad. It's cathartic.", cast: "Joel Graves, Matt Tale, Cat Bigney."),
        Series(banner: UIImage(named: "banner15")!, image: UIImage(named: "ze15")!, type: "Serie", tittle: "Stranger Things", year: 2022, ageGroup: "16", seasons: "8 Episodes", description: "On his way home from a friend's house, young Will sees something terryfying. Nearby, a sinister secret lurks in the depths of a government lab.", cast: "Winona Ryder, David Harbour, Millie Bobby Brown."),
        Series(banner: UIImage(named: "banner16")!, image: UIImage(named: "ze16")!, type: "Serie", tittle: "The Hidden Live of Pets", year: 2022, ageGroup: "AL", seasons: "4 Episodes", description: "Bow worws and purr-fect pets! Meet amazing creatures from aroung the world and dig into the latest science on our animal friends'senses and skills.", cast: "Hugh Bonneville."),
        Series(banner: UIImage(named: "banner17")!, image: UIImage(named: "ze17")!, type: "Serie", tittle: "The Lincoln Lawyer", year: 2022, ageGroup: "14", seasons: "1 Season", description: "From the Emmy-winning creator of Boston Legal and The Practice comes a spenseful new coutrroom drama based on Michael Connely's bestselling books.", cast: "Manuel Garcia-Fulfo, Neve Campbell, Becki Newton."),
        Series(banner: UIImage(named: "banner18")!, image: UIImage(named: "ze18")!, type: "Serie", tittle: "The Lincoln Lawyer", year: 2022, ageGroup: "14", seasons: "1 Season", description: "Time travel, super strenght, speaking to the dead: Each of these siblings has a prettu sweet power. But together, they're a disaster in the making.", cast: "Elliot Page, Tom Hopper, David Castaneda.")
    ]
    
    let ourMovies = [
        Films(banner: UIImage(named: "movieBanner1")!, image: UIImage(named: "fabio1")!, type: "Film", tittle: "S.W.A.T", year: 2003, ageGroup: "14", duration: "1h57m", description: "A veteran cop is tasked with drafting and training a special weapons and tactics team, who soon find themselves up against an international criminal.", cast: "Samuel L. Jackson, Colin Farrell, Michelle Rodriguez."),
        Films(banner: UIImage(named: "movieBanner2")!, image: UIImage(named: "fabio2")!, type: "Film", tittle: "Two Friends and an Alien Menace", year: 2022, ageGroup: "14", duration: "1h55m", description: "An alien invasion interrupts a bachelor party. Good thing two childhood friends are ready to fight back... with laser guns!", cast: "Axel Bøyum, Fredrik Skogsrud, Ingrid Bolsø Berdal"),
        Films(banner: UIImage(named: "movieBanner3")!, image: UIImage(named: "fabio3")!, type: "Film", tittle: "Den of Thieves", year: 2018, ageGroup: "14", duration: "2h20m", description: "A realistic crime saga that follows the lives of an elite unit of the Los Angeles Police Department and the most successful team in bank robberies as the bad guys plan a seemingly impossible heist to the Federal Reserve.", cast: "Gerard ButlerPablo, SchreiberO'Shea, Jackson Jr."),
        Films(banner: UIImage(named: "movieBanner4")!, image: UIImage(named: "fabio4")!, type: "Film", tittle: "2012", year: 2009, ageGroup: "12", duration: "2h38m", description: "A divorced father leaps into action to save his family after a series of natural disasters threatens to destroy the world.", cast: "John Cusack, Amanda Peet, Chiwetel Ejiofor."),
        Films(banner: UIImage(named: "movieBanner5")!, image: UIImage(named: "fabio5")!, type: "Film", tittle: "Nobody Knows I'm Here", year: 2020, ageGroup: "12", duration: "1h31m", description: "Traumatized, a former child singer withdraws from everything and everyone, until a woman offers him an opportunity to make peace with the past.", cast: "Jorge García, Millaray Lobos, Luis Gnecco."),
        Films(banner: UIImage(named: "movieBanner6")!, image: UIImage(named: "fabio6")!, type: "Film", tittle: "you can't imagine", year: 2020, ageGroup: "12", duration: "1h45m", description: "When a school jock asked Ellie Chu to write him a love letter, she had no idea they would become friends. And worse, that she would fall in love with his crush.", cast: "Leah Lewis, Daniel Diemer, Alexxis Lemire."),
        Films(banner: UIImage(named: "movieBanner7")!, image: UIImage(named: "fabio7")!, type: "Film", tittle: "Hustle", year: 2022, ageGroup: "12", duration: "1h58m", description: "A down-on-her-luck basketball scout finds a potentially successful player and sets out to prove that they both deserve to make it to the NBA.", cast: "Adam Sandler, Juancho Hernangómez, Queen Latifah."),
        Films(banner: UIImage(named: "movieBanner8")!, image: UIImage(named: "fabio8")!, type: "Film", tittle: "Don't Breathe", year: 2016, ageGroup: "14", duration: "1h28m", description: "He's blind and rich -- the perfect target for robbery. But the tables turn when three teen thieves find themselves in a lethal game of cat and mouse.", cast: "Jane Levy, Stephen Lang, Daniel Zovatto."),
        Films(banner: UIImage(named: "movieBanner9")!, image: UIImage(named: "fabio9")!, type: "Film", tittle: "Spider-Man: Never Go Home", year: 2021, ageGroup: "12", duration: "2h38m", description: "With Spider-Man's identity revealed, Peter turns to Doctor Strange for help. When a spell goes wrong, dangerous enemies from other worlds begin to appear, forcing Peter to discover what it really means to be Spider-Man.", cast: "Tom Holland, Zendaya, Benedict Cumberbatch"),
        Films(banner: UIImage(named: "movieBanner10")!, image: UIImage(named: "fabio10")!, type: "Film", tittle: "Spider-Man: Homecoming", year: 2017, ageGroup: "12", duration: "2h38m", description: "Peter Parker returns to routine life as a high schooler until the Vulture's arrival gives him the chance to prove himself as a web-slinging superhero.", cast: "Tom Holland, Michael Keaton, Robert Downey Jr."),
        Films(banner: UIImage(named: "movieBanner11")!, image: UIImage(named: "fabio11")!, type: "Film", tittle: "Love & Gelato", year: 2022, ageGroup: "12", duration: "1h52m", description: "Fulfilling her mother's last wish, Lina decides to spend her last summer before college in Rome, where she discovers love, many adventures and a passion for gelato.", cast: "Susanna Skaggs, Tobia De Angelis, Owen McDonnell."),
        Films(banner: UIImage(named: "movieBanner12")!, image: UIImage(named: "fabio12")!, type: "Film", tittle: "Spiderhead", year: 2022, ageGroup: "12", duration: "1h47m", description: "In a state-of-the-art prison, an inmate participates in an experiment with drugs that control emotions for a pharmaceutical genius.", cast: "Chris Hemsworth, Miles Teller, Jurnee Smollett."),
        Films(banner: UIImage(named: "movieBanner13")!, image: UIImage(named: "fabio13")!, type: "Film", tittle: "The Man from Toronto", year: 2022, ageGroup: "14", duration: "1h57m", description: "A case of mistaken identity forces a bumbling man to team up with a notorious assassin in hopes of staying alive.", cast: "Kevin Hart, Woody Harrelson, Kaley Cuoco."),
        Films(banner: UIImage(named: "movieBanner14")!, image: UIImage(named: "fabio14")!, type: "Film", tittle: "The Sentinelle", year: 2021, ageGroup: "16", duration: "1h20m", description: "After participating in a traumatizing mission, a highly trained soldier returns home and uses her lethal skills to find the man who injured her sister.", cast: "Olga Kurylenko, Marilyn Lima, Michel Nabokoff."),
        Films(banner: UIImage(named: "movieBanner15")!, image: UIImage(named: "fabio15")!, type: "Film", tittle: "Yanimda Kal", year: 2018, ageGroup: "12", duration: "1h20m", description: "Emir is a handsome, rich, successful man in his thirties. He was born into a family of workers and dedicated to study. He works day and night by putting everything in his life into the background. One of Turkey's most important investment bank has been working as an investment adviser at.", cast: "aglar Ertugrul, Meric Aral, Murat Aygen."),
        Films(banner: UIImage(named: "movieBanner16")!, image: UIImage(named: "fabio16")!, type: "Film", tittle: "I care", year: 2021, ageGroup: "16", duration: "1h59m", description: "A healer steals from elderly clients in her care. But her latest victim holds a little surprise that could put an end to the scheme.", cast: "Rosamund Pike, Peter Dinklage, Eiza Gonzalez"),
        Films(banner: UIImage(named: "movieBanner17")!, image: UIImage(named: "fabio17")!, type: "Film", tittle: "I care", year: 2002, ageGroup: "12", duration: "2h01m", description: "After being bitten by a genetically modified spider, shy Peter Parker, who discovers he can spin webs and climb walls, encounters a dangerous enemy.", cast: "Tobey Maguire, Willem Dafoe, Kirsten Dunst."),
        Films(banner: UIImage(named: "movieBanner18")!, image: UIImage(named: "fabio18")!, type: "Film", tittle: "The Avengers", year: 2012, ageGroup: "12", duration: "2h23m", description: "Earth's Mightiest Heroes must band together and learn to fight as a team to stop an alien army from enslaving humanity.", cast: "Robert Downey Jr., Chris Evans, Scarlett Johansson")
    ]
    
    public var prepareSegue = String()
    
    var inSearchImageView: UIImage = UIImage()
    var inSearchTypeTittle: String = ""
    var inSearchTittleSerie: String = ""
    var inSearchYearData: Int = 0
    var AgeGroupType: String = ""
    var inSearchSeasonsOrEpisodes: String = ""
    var inSearchDescriptionForSerie: String = ""
    var inSearchCastSerie: String = ""
    
    
    var inSearchImageViewMovie: UIImage = UIImage()
    var inSearchTypeTittleMovie: String = ""
    var inSearchTittleMovie: String = ""
    var inSearchYearDataMovie: Int = 0
    var AgeGroupTypeMovie: String = ""
    var inSearchDuration: String = ""
    var inSearchDescriptionForMovie: String = ""
    var inSearchCastMovie: String = ""
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryTittle: UILabel!
    @IBAction func segmentedControllAction(_ sender: Any) {
        switch segmentedControll.selectedSegmentIndex{
            case 0:
                change = 0
            case 1:
                change = 1
            case 2:
                change = 2
            default:
                change = 3
        }
        self.loadData()
    }
        
    func loadData() {
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Esse é: \(prepareSegue)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = prepareSegue
        segmentedControll.setTitleTextAttributes(titleTextNormal, for: .normal)
        segmentedControll.setTitleTextAttributes(titleTextSelected, for: .selected)

        segmentedControll?.setTitle("Movies", forSegmentAt: 0)
        segmentedControll?.setTitle("Series", forSegmentAt: 1)
        segmentedControll?.setTitle("Trending", forSegmentAt: 2)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        // Do any additional setup after loading the view.
        fetchAndPrintPopularMovies()

    }
    
    func fetchAndPrintPopularMovies() {
        let apiManager = TMDBAPIManager()

        apiManager.fetchPopularMovies { (movies, error) in
            if let error = error {
                print("Erro ao obter filmes populares: \(error)")
                return
            }
            
            if let movies = movies {
                films = movies // Atribuir os filmes à matriz `films` da sua ViewController
                DispatchQueue.main.async {
                    self.collectionView?.reloadData() // Atualizar a collectionView após receber os dados
                }
            }
        }
    }
}

extension SearchExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count - 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if change == 0 {
            cell.setupFilm(with: ourMovies[indexPath.row])
            
            categoryTittle.text = "Movies"
        } else if change == 1 {
            cell.setupSeries(with: series[indexPath.row])
            
            categoryTittle.text = "Series"
        } else if change == 2 {
            cell.setupTrending(with: films[indexPath.row])
            
            categoryTittle.text = "Trending"
        } else if change == 3 {
            print("Erro")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = indexPath.item
        
        inSearchImageView = series[indexPath.item].banner
        inSearchTypeTittle = series[indexPath.item].type
        inSearchTittleSerie = series[indexPath.item].tittle
        inSearchYearData = series[indexPath.item].year
        AgeGroupType = series[indexPath.item].ageGroup
        inSearchSeasonsOrEpisodes = series[indexPath.item].seasons
        inSearchDescriptionForSerie = series[indexPath.item].description
        inSearchCastSerie = series[indexPath.item].cast
        
        inSearchImageViewMovie = ourMovies[indexPath.item].banner
        inSearchTypeTittleMovie = ourMovies[indexPath.item].type
        inSearchTittleMovie = ourMovies[indexPath.item].tittle
        inSearchYearDataMovie = ourMovies[indexPath.item].year
        AgeGroupTypeMovie = ourMovies[indexPath.item].ageGroup
        inSearchDuration = ourMovies[indexPath.item].duration
        inSearchDescriptionForMovie = ourMovies[indexPath.item].description
        inSearchCastMovie = ourMovies[indexPath.item].cast
        
        print(inSearchYearData)
        
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Modally") as? ModallyViewController
        
        nextViewController?.modallyImageView = inSearchImageView
        nextViewController?.modallyTypeTittle = inSearchTypeTittle
        nextViewController?.modallyTittleSerie = inSearchTittleSerie
        nextViewController?.modallyYearData = inSearchYearData
        nextViewController?.modallyAgeGroupType = AgeGroupType
        nextViewController?.modallySeasonsOrEpisodes = inSearchSeasonsOrEpisodes
        nextViewController?.modallyDescriptionForSerie = inSearchDescriptionForSerie
        nextViewController?.modallyCastSerie = inSearchCastSerie
        
        nextViewController?.modallyImageViewMovie = inSearchImageViewMovie
        nextViewController?.modallyTypeTittleMovie = inSearchTypeTittleMovie
        nextViewController?.modallyTittleSerieMovie = inSearchTittleMovie
        nextViewController?.modallyYearDataMovie = inSearchYearDataMovie
        nextViewController?.modallyAgeGroupTypeMovie = AgeGroupTypeMovie
        nextViewController?.modallySeasonsOrEpisodesMovie = inSearchDuration
        nextViewController?.modallyDescriptionForSerieMovie = inSearchDescriptionForMovie
        nextViewController?.modallyCastSerieMovie = inSearchCastMovie
        
        //navigationController?.pushViewController(nextViewController!, animated: true)
        if change == 0 || change == 1 {
            present(nextViewController!, animated: true, completion: nil)
        }
       

    }
}


extension SearchExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 108, height: 152)
    }
}
