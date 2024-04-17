//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 15/04/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    private lazy var movieTextTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .accent
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .accent
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    func configureCell(movie: Movie) {
        movieImageView.image = UIImage(named: movie.image)
        movieTextTitleLabel.text = movie.title
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
    }
    
    private func addSubviews() {
        addSubview(movieImageView)
        addSubview(movieTextTitleLabel)
        addSubview(movieReleaseDateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieTextTitleLabel.bottomAnchor.constraint(equalTo: movieImageView.centerYAnchor),
            movieTextTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTextTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: movieTextTitleLabel.leadingAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
