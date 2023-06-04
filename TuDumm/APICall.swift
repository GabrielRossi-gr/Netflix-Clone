//
//  APICall.swift
//  TuDumm
//
//  Created by Pedro Franco on 30/05/23.
//

import UIKit
import Foundation

struct Movie {
    let title: String
    let overview: String
    let releaseDate: String
    let poster_path: String
    let backdrop_path: String
}

class TMDBAPIManager {
    let apiKey = "2880d225c6c02999a1f203250c288596"
    let baseURL = "https://api.themoviedb.org/3"

    func fetchPopularMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let jsonDictionary = json as? [String: Any], let jsonMovies = jsonDictionary["results"] as? [[String: Any]] {
                        
                        var movies: [Movie] = []
                        
                        for jsonMovie in jsonMovies {
                            if let title = jsonMovie["title"] as? String,
                               let overview = jsonMovie["overview"] as? String,
                               let releaseDate = jsonMovie["release_date"] as? String,
                               let poster = jsonMovie["poster_path"] as? String,
                               let backdrop = jsonMovie["backdrop_path"] as? String {
                                let movie = Movie(title: title, overview: overview, releaseDate: releaseDate, poster_path: poster, backdrop_path: backdrop)
                                movies.append(movie)
                            }
                        }
                        
                        completion(movies, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}

func fetchAndPrintPopularMovies() {
    let apiManager = TMDBAPIManager()

    apiManager.fetchPopularMovies { (movies, error) in
        if let error = error {
            print("Erro ao obter filmes populares: \(error)")
            return
        }
        
        if let movies = movies {
            for movie in movies {
                print("Título: \(movie.title)")
                print("Visão geral: \(movie.overview)")
                print("Data de lançamento: \(movie.releaseDate)")
                print("Imagem pequena: \(movie.poster_path)")
                print("Imagem grande: \(movie.backdrop_path)")
                print("=====================")
                
                let filmes: [Movie] = [
                    Movie(title: movie.title, overview: movie.overview, releaseDate: movie.releaseDate, poster_path: movie.poster_path, backdrop_path: movie.backdrop_path)
                ]
            }
        }
    }
}

