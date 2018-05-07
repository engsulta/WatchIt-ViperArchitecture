//
//  MovieListRemoteDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
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
