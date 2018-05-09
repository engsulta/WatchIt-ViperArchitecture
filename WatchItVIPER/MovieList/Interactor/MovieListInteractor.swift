//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
class MovieListInteractor: MovieListInteractorInputProtocol {
    weak var presenter: MovieListInteractorOutputProtocol?
    var localDatamanager: MovieListLocalDataManagerInputProtocol?
    var remoteDatamanager: MovieListRemoteDataManagerInputProtocol?
    
    // Mark - offline first 
   
    func retrieveMovieList() {
        do {
            if let movieList = try localDatamanager?.retrieveMovieList() {
                let movieModelList = movieList.map() {
                    return MovieModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
                }
                if  movieModelList.isEmpty {
                    remoteDatamanager?.retrieveMovieList()
                }else{
                   presenter?.didRetrieveMovies(movieModelList)
                }
            } else {
                remoteDatamanager?.retrieveMovieList()
            }
            
        } catch {
            presenter?.didRetrieveMovies([])
        }
    }
        
}
// Mark - callback methods
extension MovieListInteractor: MovieListRemoteDataManagerOutputProtocol {
    
    func onMoviesRetrieved(_ movies: [MovieModel]) {
        presenter?.didRetrieveMovies(movies) // notify presenter that data has arrived 
        
        for movieModel in movies {
            do {
                try localDatamanager?.saveMovie(id: movieModel.id, title: movieModel.title, imageUrl: movieModel.imageUrl, thumbImageUrl: movieModel.thumbImageUrl)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
