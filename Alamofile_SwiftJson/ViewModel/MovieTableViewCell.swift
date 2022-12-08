//
//  MovieTableViewCell.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import UIKit
import AVKit
import AVFoundation

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
