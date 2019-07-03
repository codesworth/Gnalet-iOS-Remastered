//
//  HomeOptionsCell.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import MaterialComponents

class HomeOptionsCell: UITableViewCell {

    @IBOutlet weak var overlay: MDCCard!

    @IBOutlet weak var optionlable: UILabel!
    @IBOutlet weak var iconimageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //ovarlay.addCorner(hasShadow:true)
        overlay.cornerRadius = 5
        overlay.setShadowElevation(ShadowElevation(rawValue: 4), for: .normal)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(option:Options){
        optionlable.text = option.name
        iconimageView.image = UIImage(named: option.icon)
    }
    
}
