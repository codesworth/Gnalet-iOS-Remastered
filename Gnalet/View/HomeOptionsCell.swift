//
//  HomeOptionsCell.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class HomeOptionsCell: UITableViewCell {

    @IBOutlet weak var ovarlay: UIView!
    @IBOutlet weak var optionlable: UILabel!
    @IBOutlet weak var iconimageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ovarlay.addShadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
