
//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
import Foundation
import UIKit

protocol MovieListViewProtocol: class {
    
    var presenter: MovieListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showMovies(with Movies: [MovieModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol MovieListWireFrameProtocol: class {
    static func createMovieListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie movie: MovieModel)
}

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorInputProtocol? { get set }
    var wireFrame: MovieListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showMovieDetail(forMovie movie: MovieModel)
}

protocol MovieListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveMovies(_ movies: [MovieModel])
    func onError()
}

protocol MovieListInteractorInputProtocol: class {
    var presenter: MovieListInteractorOutputProtocol? { get set }
    var localDatamanager: MovieListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MovieListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveMovieList()
}

protocol MovieListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MovieListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveMovieList()
}

protocol MovieListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onMoviesRetrieved(_ movies: [MovieModel])
    func onError()
}

protocol MovieListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveMovieList() throws -> [Movie]
    func saveMovie(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}
