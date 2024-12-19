//
//  SuperHeroeViewCell.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 19/12/24.
//

import UIKit

class SuperHeroeViewCell: UITableViewCell {

    @IBOutlet weak var superImageView: UIImageView!
    @IBOutlet weak var nameSuperLabel: UILabel!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        indicatorView.hidesWhenStopped = true
        indicatorView.startAnimating()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(superheroe: SuperHeroe)
    {
        
        nameSuperLabel.text = superheroe.name
        superImageView.loadFrom(url: superheroe.image.url)
       // indicatorView.stopAnimating()
    }

}
