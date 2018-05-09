//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
class MovieListPresenter: MovieListPresenterProtocol {
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorInputProtocol?
    var wireFrame: MovieListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveMovieList()
    }
    
    func  (forMovie movie: MovieModel) {
        wireFrame?.presentMovieDetailScreen(from: view!, forMovie: movie)
    }

}
// Mark callBack Methods
// here we notify view with changes

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [MovieModel]) {
        view?.hideLoading()
        view?.showMovies(with: movies)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


