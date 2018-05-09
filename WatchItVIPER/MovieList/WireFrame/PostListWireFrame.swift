///  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//

import UIKit

class MovieListWireFrame: MovieListWireFrameProtocol {
    
    class func createMovieListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MoviesNavigationController")
        if let view = navController.childViewControllers.first as? MovieListView {
            let presenter: MovieListPresenterProtocol & MovieListInteractorOutputProtocol = MovieListPresenter()
            let interactor: MovieListInteractorInputProtocol & MovieListRemoteDataManagerOutputProtocol = MovieListInteractor()
            let localDataManager: MovieListLocalDataManagerInputProtocol = MovieListLocalDataManager()
            let remoteDataManager: MovieListRemoteDataManagerInputProtocol = MovieListRemoteDataManager()
            let wireFrame: MovieListWireFrameProtocol = MovieListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    

    func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie movie: MovieModel) {
        let movieDetailViewController = MovieDetailWireFrame.createMovieDetailModule(forMovie: movie)
   
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(movieDetailViewController, animated: true)
        }
    }
    
}
