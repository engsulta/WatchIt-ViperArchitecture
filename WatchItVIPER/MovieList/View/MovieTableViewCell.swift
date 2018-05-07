

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
