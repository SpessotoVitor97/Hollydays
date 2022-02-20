//
//  DestinationTableViewCell.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 20/02/22.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {

    @IBOutlet weak var destinationImage: UIImageView!
    @IBOutlet weak var destinationName: UILabel!
    @IBOutlet weak var destinationPark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 15
//        contentView.backgroundColor = .systemBackground
    }
}
