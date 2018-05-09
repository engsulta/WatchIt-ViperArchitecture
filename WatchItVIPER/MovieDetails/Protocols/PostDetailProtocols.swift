///  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
import UIKit

protocol MovieDetailViewProtocol: class {
    var presenter: MovieDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    
    func showMovieDetail(forMovie movie: MovieModel)
}
protocol MovieDetailWireFrameProtocol: class {
    static func createMovieDetailModule(forMovie movie: MovieModel) -> UIViewController
}

protocol MovieDetailPresenterProtocol: class {
    var view: MovieDetailViewProtocol? { get set }
    var wireFrame: MovieDetailWireFrameProtocol? { get set }
    var movie: MovieModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
