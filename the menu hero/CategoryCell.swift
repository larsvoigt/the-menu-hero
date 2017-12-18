//
//  CategoryCell.swift
//  the menu hero
//
//  Created by Lars Voigt  on 14.12.17.
//  Copyright © 2017 Lars Voigt . All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    var customBounds : CGRect!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        customBounds = CGRect(x: self.bounds.origin.x + 10, y: self.bounds.origin.y + 10, width: self.bounds.size.width - 10, height: self.bounds.size.height - 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        // Set the width of the cell
        self.bounds = customBounds
        super.layoutSubviews()
    }

}
