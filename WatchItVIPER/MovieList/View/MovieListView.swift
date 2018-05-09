//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
import UIKit
import PKHUD

class MovieListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: MovieListPresenterProtocol?
    var movieList: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
}

extension MovieListView: MovieListViewProtocol {
    
    func showMovies(with movies: [MovieModel]) {
        movieList = movies
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension MovieListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movieList[indexPath.row]
        cell.set(forMovie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMovieDetail(forMovie: movieList[indexPath.row])
    }
    
}
