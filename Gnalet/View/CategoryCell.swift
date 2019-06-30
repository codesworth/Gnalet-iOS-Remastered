//
//  CategoryCell.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var issueinfoImageView: UIImageView!
    @IBOutlet weak var issuelable: UILabel!
    private var info:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        issueinfoImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(infoTapped(_:)))
        // Initialization code
    }
    
    @objc func infoTapped(_ recognizer:UITapGestureRecognizer){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(_ category:Category){
        issuelable.text = category.title
        info = category.info
    }
    
    
}
