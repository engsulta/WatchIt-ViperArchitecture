//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieListRemoteDataManager:MovieListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol?
    
    func retrieveMovieList() {
        Alamofire
            .request(Endpoints.Movies.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[MovieModel]>) in
                switch response.result {
                case .success(let movies):
                    self.remoteRequestHandler?.onMoviesRetrieved(movies)//notify success 
            
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
