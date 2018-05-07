//
//  Movie.swift
//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Movie: Object  {
   
    dynamic var title : String?
    dynamic var rating : Double?
    dynamic var id : Int?
    dynamic var viewCount:Int?
    dynamic var popularity:Double?
    dynamic var overview: String?
    dynamic var releaseDate:String?
    dynamic var backDropPath:String?
    dynamic var trailerKey:String?
    dynamic var posterPath:String?
    
    
    convenience init(id:Int,title:String,rating:Double,viewCount:Int,overview:String,releaseDate:String,backDropPath:String,poster:String) {
        self.init()

        self.id = id
        self.title = title
        self.rating = rating
        self.backDropPath = backDropPath
        self.posterPath = poster
        self.releaseDate = releaseDate
        self.viewCount = viewCount
        self.overview = overview
    }
}
