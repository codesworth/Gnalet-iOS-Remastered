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
    
    private lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounces = true
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
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
    
    private lazy var locationInput:LocationTextinput = {
        let loca = LocationTextinput(frame: .zero)
        return loca
    }()
    
    private lazy var descriptionInput:TextViewInput = {
        let input  = TextViewInput(frame: .zero)
        return input
    }()
    
//    private lazy var regionPicker:UIPickerView = {
//        let picker = UIPickerView(frame: .zero)
//        picker.backgroundColor = .white
//
//    }()
    
    private lazy var submitbutton:UIButton = {
        let button =  UIButton(frame: .zero)
        button.setTitle("SUBMIT", for: .normal)
        button.backgroundColor = .primary
        button.setTitleColor(.white, for: .normal)
        return button
    }()


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize(){
        backgroundColor = .white
    }
}
