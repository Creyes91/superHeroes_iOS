//
//  SuperHeroCollectionViewCell.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 7/1/25.
//

import UIKit

class SuperHeroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    func loadData(superheroe: SuperHeroe)
    {
        ImageView.image = nil
       //self.indicatorView.startAnimating()
        nameLabel.text = superheroe.name
        ImageView.loadFrom(url: superheroe.image.url)
        //self.indicatorView.stopAnimating()
    }
}
