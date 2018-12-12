//
//  ViewControllerTableViewCell.swift
//  Marvelous
//
//  Created by Madhu Rimmalapudi on 12/11/18.
//  Copyright © 2018 Mark Turner. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureCell(_ cell:UITableViewCell , atIndexPath indexPath:IndexPath, withDataSource datasource:Character){
        if let name = datasource.name {
            cellLabelView?.text = name
        }else{
            cellLabelView?.text = "no name"
        }
        if let path = datasource.thumbnail?.url {
                ImageCacheLoader.getImage(withUrl: path){ (image) in
                self.cellImageView.image = image
            }
        }
        
    }

}
