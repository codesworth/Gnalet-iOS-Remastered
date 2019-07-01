//
//  GeneralReportView.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class GeneralReportView: UIView {
    
    // MARK:- Components
    
    private lazy var imagePickerView:ImagePickerView = {
        let view = ImagePickerView(frame: .zero)
        return view
    }()
    
    private lazy var emmergencylable:UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .red
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private locatuon


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize(){
        
    }
}
