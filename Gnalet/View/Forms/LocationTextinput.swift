//
//  LocationTextinput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class LocationTextinput: UIView {

    //MARK: - Components
    private lazy var textField:BasicTextInput = {
        let field = BasicTextInput(frame: .zero)
        field.isUserInteractionEnabled = false
        return field
    }()
    
    private lazy var button:UIButton = { [unowned self] by in
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        button.backgroundColor = .primary
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitle("ADJUST", for: .normal)
        button.addTarget(self, action: #selector(adjustButtonPressed(_:)), for: .touchUpInside)
        return button
    }(())
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        backgroundColor = .white
        addSubview(stack)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(button)
//        addSubview(textField)
//        addSubview(button)
    }
    
    //MARK:- LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.layout{
            $0.leading == leadingAnchor
            $0.top == topAnchor
            $0.trailing == trailingAnchor
            $0.bottom == bottomAnchor
        }
        
//        button.layout{
//            $0.trailing == trailingAnchor
//            $0.top == topAnchor
//            $0.bottom == bottomAnchor
//            $0.width |=| 100
//        }
//        textField.layout{
//            $0.leading == leadingAnchor
//            $0.trailing == button.leadingAnchor
//            $0.top == topAnchor
//            $0.bottom == bottomAnchor
//        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        button.isHidden = true
    }
    
    //MARK:- SELECTOR
    @objc func adjustButtonPressed(_ sender:UIButton){
        
    }

}
