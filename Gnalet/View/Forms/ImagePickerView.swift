//
//  ImagePickerView.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class ImagePickerView: UIView {

    // MARK: - Components
    
    private lazy var imageview:UIImageView = { [unowned self] by in
        let imgv = UIImageView(frame: .zero)
        imgv.contentMode = .scaleAspectFit
        imgv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedgesture(_:)))
        tap.numberOfTapsRequired = 1
        imgv.addGestureRecognizer(tap)
        return imgv
    }(())
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initialize(){
        addSubview(imageview)
        backgroundColor = .white
    }
    
    //MARK: - LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageview.layout{
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.trailing == trailingAnchor
            $0.leading == leadingAnchor
        }
    }
    
    //MARK: - SELECTORS
    @objc func tappedgesture(_ recognizer:UITapGestureRecognizer){
        
    }

}
