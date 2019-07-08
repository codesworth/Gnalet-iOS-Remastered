//
//  DetailsCard.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 08/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import MaterialComponents.MDCCard

class DetailCard:MDCCard{
    
    private lazy var header:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Location Details"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var adrressLine:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label

    }()
    
    private lazy var latLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label
        
    }()
    
    private lazy var confirmButt:UIButton = { [unowned self] by in
        let butt = UIButton(frame: .zero)
        butt.backgroundColor = .primary
        butt.setTitle("CONFIRM", for: .normal)
        butt.setTitleColor(.white, for: .normal)
        butt.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        butt.addTarget(self, action: #selector(locationConfirmed(_:)), for: .touchUpInside)
        return butt
    }()
    
    private lazy var longLable:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initialize(){
        setShadowElevation(ShadowElevation(5), for: .normal)
        cornerRadius = 10
        isInteractable = false
    }
    
    
    //MARK: - SELECTORS
    
    @objc func locationConfirmed(_ sender:UIButton){
        
    }
}
