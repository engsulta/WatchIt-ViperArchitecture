//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieModel {
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
    
}

extension MovieModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        title     <- map["title"]
        imageUrl     <- map["url"]
        thumbImageUrl     <- map["thumbUrl"]
    }
    
}
