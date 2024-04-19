//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 17/04/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    let movie: Movie
    
    private lazy var movieTextTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .accent
        return label
        
    }()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: movie.image)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var movieUsersRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .accent
        return label
    }()
    
    private lazy var movieSynopsis: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .accent
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        label.attributedText = NSAttributedString(string: movie.synopsis, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()

    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(movieTextTitle)
        view.addSubview(movieImage)
        view.addSubview(movieUsersRate)
        view.addSubview(movieSynopsis)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieTextTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -32),
            movieTextTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieImage.topAnchor.constraint(equalTo: movieTextTitle.bottomAnchor, constant: 32),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 235),
            movieImage.widthAnchor.constraint(equalToConstant: 176),
            
            movieUsersRate.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 24),
            movieUsersRate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieSynopsis.topAnchor.constraint(equalTo: movieUsersRate.bottomAnchor, constant: 40),
            movieSynopsis.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieSynopsis.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

