//
//  CategoryCell.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import MaterialComponents

class CategoryCell: UITableViewCell {

    @IBOutlet weak var overlay: MDCCard!
    @IBOutlet weak var issueinfoImageView: UIImageView!
    @IBOutlet weak var issuelable: UILabel!
    private var info:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
       overlay.setShadowElevation(ShadowElevation(rawValue: 4), for: .normal)
        issueinfoImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(infoTapped(_:)))
        tap.numberOfTapsRequired = 1
        issueinfoImageView.addGestureRecognizer(tap)
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(infoTapped(_:)))
        
        longPress.minimumPressDuration = 2
        addGestureRecognizer(longPress)
        // Initialization code
    }
    
    @objc func infoTapped(_ recognizer:UITapGestureRecognizer){
        let alert = MDCAlertController(title: "INFO", message: info)
        let action = MDCAlertAction(title: "OK", handler: nil)
        alert.addAction(action)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
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
