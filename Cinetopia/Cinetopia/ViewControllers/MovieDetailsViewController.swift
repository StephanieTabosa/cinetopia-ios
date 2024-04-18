//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 17/04/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        title = movie.title
    }
}
