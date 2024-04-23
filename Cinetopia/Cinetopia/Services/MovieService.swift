//
//  MovieService.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 22/04/24.
//

import Foundation

struct MovieService {
    func getMovies() {
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            print(response)
            print(error)
        }
        
        task.resume()
    }
}
