//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
import UIKit

class MovieDetailWireFrame: MovieDetailWireFrameProtocol {
    
    class func createMovieDetailModule(forMovie movie: MovieModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailController")
        if let view = viewController as? MovieDetailView {
            let presenter: MovieDetailPresenterProtocol = MovieDetailPresenter()
            let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.movie = movie
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}


