//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 09/04/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    private let movieService: MovieService = MovieService()
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchTextField.backgroundColor = .accent
        search.placeholder = "Pesquisar"
        search.delegate = self
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        addSubviews()
        setupConstraints()
        setupNavigationBar()
        Task {
            await fetchMovies()
        }
    }
    
    @objc private func hideKeyboard() {
            searchBar.resignFirstResponder()
        }
    
    private func fetchMovies() async {
        do {
            movies = try await movieService.getMovies()
            tableView.reloadData()
        } catch (let error){
            print(error)
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func setupNavigationBar() {
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = searchBar
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
            let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
            cell.configureCell(movie: movie)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        let movieDetailsVC = MovieDetailsViewController(movie: movie)
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
}
