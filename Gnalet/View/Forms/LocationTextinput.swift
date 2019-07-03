//
//  LocationTextinput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationTextinput: UIView {

    //MARK: - Components
    private lazy var textField:BasicTextInput = {
        let field = BasicTextInput(frame:[0])//[0,0,UIScreen.width - 32,60] )
        field.isUserInteractionEnabled = false
        return field
    }()
    
    private var locationService:LocationService?
    
    private lazy var button:UIButton = { [unowned self] by in
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        button.backgroundColor = .primary
        
        button.roundCorners([.layerMaxXMinYCorner,.layerMaxXMaxYCorner], radius: 4)
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
        stack.distribution = .fill
        stack.spacing = 0
        return stack
    }()
    
    fileprivate var address:GMSAddress?{
        didSet{
            guard let add = address else {return}
            textField.setText(add.lines?.first)
        }
    }
    
    var placeholder:String =  .empty{
        didSet{
            textField.placeholder = "Location"
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
        initialize()
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
        locationService = LocationService()
        locationService?.delegate = self
        
    }
    
    //MARK:- SELECTOR
    @objc func adjustButtonPressed(_ sender:UIButton){
        
    }

}


extension LocationTextinput:LocationServiceDelegate{
    
    func locationupdated(_ address: GMSAddress) {
        self.address = address
    }
}


