//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var view: MovieDetailViewProtocol?
    var wireFrame: MovieDetailWireFrameProtocol?
    var movie: MovieModel?
    
    func viewDidLoad() {
        view?.showMovieDetail(forMovie: movie!)
    }
    
}

