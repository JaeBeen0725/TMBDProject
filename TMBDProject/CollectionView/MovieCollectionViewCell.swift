//
//  MovieCollectionViewCell.swift
//  TMBDProject
//
//  Created by Jae Oh on 2023/08/16.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet var movieThumbnailImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieCastLabel: UILabel!
    
    @IBOutlet var movieDateLabel: UILabel!
    @IBOutlet var movieGenreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
