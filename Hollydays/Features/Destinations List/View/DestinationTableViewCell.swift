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
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override class func description() -> String {
        "DestinationCell"
    }
    
    private func configureLayout() {
        destinationImage.layer.cornerRadius = 15
        destinationImage.contentMode = .scaleToFill
        
        destinationName.textColor = .systemBackground
        destinationName.font = .boldSystemFont(ofSize: 21)
        
        destinationPark.textColor = .systemBackground
        destinationPark.font = .boldSystemFont(ofSize: 18)
    }
    
    func setup(for destination: DestinationModel) {
        destinationImage.image = UIImage(named: destination.imageName)
        destinationName.text = destination.name
        destinationPark.text = destination.park
    }
}
