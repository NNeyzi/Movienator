//
//  MovieDBClient.swift
//  Movienator
//
//  Created by Nader Neyzi on 3/4/18.
//  Copyright © 2018 Nader Neyzi. All rights reserved.
//

import Foundation
import AFNetworking

private let params = ["api_key": "813e5b9c56148c937bdba11ec14d9213"]

class MovieDBClient {

    let imageURLStr = "https://image.tmdb.org/t/p/w300/"

    static let sharedIntance = MovieDBClient()

    func getMovies(success: @escaping ([Movie]) -> (), failure: @escaping (Error) -> ()) {
        let resourceUrl = "https://api.themoviedb.org/3/movie/now_playing"

        let manager = AFHTTPSessionManager()

        manager.get(resourceUrl, parameters: params, progress: nil, success: { (task, response) in
            var movies: [Movie] = []

            if let response = response as? [String: Any] {
                if let results = response["results"] as? [[String: Any]] {
                    for result in results {
                        if let movie = Movie(json: result) {
                            movies.append(movie)
                        }
                    }
                }
            }

            success(movies)
        }) { (task, error) in
            failure(error)
        }
    }

}
