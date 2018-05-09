
//  WatchItVIPER
//
//  Created by Sulta on 5/1/18.
//  Copyright © 2018 Sulta. All rights reserved.
//
import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forMovie movie: MovieModel) {
        self.selectionStyle = .none
        titleLabel?.text = movie.title
        let url = URL(string: movie.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        movieImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
