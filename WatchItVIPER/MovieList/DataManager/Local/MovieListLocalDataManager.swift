//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//

import CoreData

class MovieListLocalDataManager:MovieListLocalDataManagerInputProtocol {
    
    func retrieveMovieList() throws -> [Movie]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Movie> = NSFetchRequest(entityName: String(describing: Movie.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveMovie(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newMovie = NSEntityDescription.entity(forEntityName: "Movie",
                                                           in: managedOC) {
            let movie = Movie(entity: newMovie, insertInto: managedOC)
            movie.id = Int32(id)
            movie.title = title
            movie.imageUrl = imageUrl
            movie.thumbImageUrl = thumbImageUrl
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
    
    }
    
}
