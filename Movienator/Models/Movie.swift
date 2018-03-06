//
//  Movie.swift
//  Movienator
//
//  Created by Nader Neyzi on 3/4/18.
//  Copyright © 2018 Nader Neyzi. All rights reserved.
//

import Foundation

class Movie: NSObject {

    var title: String
    var overview: String
    var posterPath: String

    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let overview = json["overview"] as? String,
            let posterPath = json["poster_path"] as? String
            else {
                return nil
        }

        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
}
