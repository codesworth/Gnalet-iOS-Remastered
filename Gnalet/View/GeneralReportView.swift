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
    
    private lazy var contentView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
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
        label.text = "Emmergency - Police"
        return label
    }()
    
    private lazy var locationInput:LocationTextinput = {
        let loca = LocationTextinput(frame: .zero)
        loca.placeholder = "Location"
        return loca
    }()
    
    private lazy var descriptionInput:TextViewInput = {
        let input  = TextViewInput(frame: .zero)
        return input
    }()
    
    private lazy var regionPicker:RegionPickerInput = {
        let picker = RegionPickerInput(frame: .zero)
        return picker
    }()
    
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
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize(){
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imagePickerView)
        contentView.addSubview(emmergencylable)
        contentView.addSubview(locationInput)
        contentView.addSubview(descriptionInput)
        contentView.addSubview(regionPicker)
        contentView.addSubview(submitbutton)
    }
    
    //MARK: - LAYOUT
    override func layoutSubviews() {
        
        super.layoutSubviews()
        scrollView.layout{
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
        contentView.layout{
            $0.top == scrollView.topAnchor
            $0.bottom == scrollView.bottomAnchor
            $0.trailing == scrollView.trailingAnchor
            $0.leading == scrollView.leadingAnchor
            $0.width |=| bounds.width
            $0.height |=| 600
        }
        
        imagePickerView.layout{
            $0.top == contentView.topAnchor + 20
            $0.centerX == contentView.centerXAnchor
            $0.width |=| 200
            $0.height |=| 200
            
        }
        emmergencylable.layout{
            $0.top == imagePickerView.bottomAnchor + 12
            $0.centerX == contentView.centerXAnchor
        }
        
        locationInput.layout{
            $0.top == emmergencylable.bottomAnchor + 12
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 60
        }
        
        descriptionInput.layout{
            $0.top == locationInput.bottomAnchor + 12
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 140
        }
        
        regionPicker.layout{
            $0.top == descriptionInput.bottomAnchor + 12
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 40
        }
        
        submitbutton.layout{
            $0.top == descriptionInput.bottomAnchor + 12
            $0.centerX == contentView.centerXAnchor
            $0.height |=| 40
            $0.width |=| 120
        }
    }
}
