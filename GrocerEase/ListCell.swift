//
//  ListCell.swift
//  GrocerEase
//
//  Created by Chris Drewry on 5/4/16.
//  Copyright © 2016 Chris Drewry. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var healthImg: UIImageView!
    @IBOutlet weak var costImg: UIImageView!
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var mealImg: UIImageView!
    
    var list: List! {
        didSet {
            nameLabel.text = list.name
            
            if list.tags[0] { //healthy
                healthImg.hidden = false
//                healthImg.image = UIImage(named: "greencarrot.png")
            }
            if list.tags[1] || list.tags[2] { //cheap or expensive
                costImg.hidden = false
                if list.tags[1] {
                    costImg.image = UIImage(named: "cheap.png")
                }
                if list.tags[2] {
                    costImg.image = UIImage(named: "expensive.png")
                }
            }
            if list.tags[3] { //favorite
                favImg.hidden = false
            }
            if list.tags[4] { //meal
                mealImg.hidden = false
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
