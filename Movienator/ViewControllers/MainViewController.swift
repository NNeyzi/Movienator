//
//  ViewController.swift
//  Movienator
//
//  Created by Nader Neyzi on 3/4/18.
//  Copyright © 2018 Nader Neyzi. All rights reserved.
//

import UIKit

let darkColor = UIColor(red: 30/255, green: 32/255, blue: 40/255, alpha: 1.0)
let blueishColor = UIColor(red: 0/255, green: 160/255, blue: 190/255, alpha: 1.0)
let lightColor = UIColor(red: 230/255, green: 229/255, blue: 230/255, alpha: 1.0)
let movieNatorColor = UIColor(red: 219/255, green: 44/255, blue: 56/255, alpha: 1.0)

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var movies: [Movie] = []

    let movieDB = MovieDBClient.sharedIntance

    override func viewDidLoad() {
        super.viewDidLoad()

        // TableView
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 117

        // Colors
        tableView.backgroundColor = darkColor
        view.backgroundColor = darkColor
        navigationController?.navigationBar.barTintColor = darkColor
        let textAttributes = [NSAttributedStringKey.foregroundColor:movieNatorColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        // Title
        title = "MOVIENATOR"

        // MovieDB API Request
        movieDB.getMovies(success: { (movies) in
            self.movies = movies

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, failure: { (error) in
            print(error)
        })
    }

}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self), for: indexPath) as! MovieTableViewCell

        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        let posterURLStr = movieDB.imageURLStr + movie.posterPath
        if let posterURL = URL(string: posterURLStr) {
            cell.posterImageView.setImageWith(posterURL, placeholderImage: nil)
        }

        return cell
    }

}

