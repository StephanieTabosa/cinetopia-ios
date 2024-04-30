//
//  MovieService.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 22/04/24.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies(completion: @escaping (Result<[Movie], MovieServiceError>) -> Void) {
        
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch(_) {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}
