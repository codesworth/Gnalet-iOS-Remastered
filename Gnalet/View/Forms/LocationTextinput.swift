//
//  LocationTextinput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import GoogleMaps
import MaterialComponents.MDCProgressView

class LocationTextinput: UIView {

    typealias LocationData = (address:GMSAddress,coordinate:CLLocationCoordinate2D)
    //MARK: - Components
    private lazy var textField:BasicTextInput = {
        let field = BasicTextInput(frame:[0])//[0,0,UIScreen.width - 32,60] )
        field.isUserInteractionEnabled = false
        field.shouldShowLine = false
        return field
    }()
    
    private var locationService:LocationService?
    private var toggletint = false{
        didSet{
            if toggletint{
                loader.trackTintColor = tintOne
                loader.progressTintColor = tint2
            }else{
                loader.progressTintColor = tintOne
                loader.trackTintColor = tint2
            }
        }
    }
    private var progress:Float = 0.0{
        didSet{
            if progress > 1.05 {
                toggletint = !toggletint
            }
        }
    }
    
    private lazy var button:UIButton = { [unowned self] by in
        let button = UIButton(frame: .zero)//(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
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
    
    private let tintOne = UIColor.primary
    private let tint2 = UIColor.white//primary.withAlphaComponent(0.30)
    
    private var loader:MDCProgressView = {
        let progress = MDCProgressView(frame: .zero)
        progress.setHidden(false, animated: true, completion: nil)
        return progress
    }()
    
    var address:GMSAddress?{
        didSet{
            guard let add = address else {return}
            if let country = add.country{
               textField.setText(add.lines?.first?.replacingOccurrences(of: country, with: ""))
            }else{
                textField.setText(add.lines?.first)
            }
            button.isHidden = false
        }
    }
    
    func formatAddrDisplay(address:GMSAddress){
        if let country = address.country, let subl = address.subLocality{
            let line1 = address.lines?.first
            let final = line1?.replacingOccurrences(of: country, with: "").replacingOccurrences(of: ",", with: "")
            var fina = final?.components(separatedBy: " ")
            if fina?.last == subl{
                fina?.removeLast()
                
            }
        }
    }
    
    fileprivate var coordinate:CLLocationCoordinate2D?
    
    var placeholder:String =  .empty{
        didSet{
            textField.placeholder = "Location"
        }
    }
    
    func getLocationData()->LocationData?{
        if let ad = address, let co = coordinate{
            return (ad,co)
        }
        return nil
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
        addSubview(textField)
        addSubview(button)
        addSubview(loader)
        loader.trackTintColor = tint2
        loader.progressTintColor = tintOne
        textField.textPlaceHolder = "Finding Location"
    }
    
    //MARK:- LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()

        

        button.layout{
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.bottom == loader.topAnchor
            $0.width |=| 80
        }
        textField.layout{
            $0.leading == leadingAnchor
            $0.trailing == button.leadingAnchor
            $0.top == topAnchor
            $0.bottom == loader.topAnchor
        }
        loader.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.bottom == bottomAnchor
            $0.height |=| 2
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setProgress()
        button.isHidden = true
        locationService = LocationService()
        locationService?.delegate = self
        
    }
    
    func setProgress(){
        if loader.isHidden {return}
        loader.setProgress(progress, animated: true) { _ in
            
            if self.progress < 1.1{
                self.progress += 0.1
            }else{
                self.progress = 0
            }
            
            self.setProgress()
        }
    }
    
    //MARK:- SELECTOR
    @objc func adjustButtonPressed(_ sender:UIButton){
        Subscription.main.post(suscription: .launchMaps, object: coordinate)
    }

}


extension LocationTextinput:LocationServiceDelegate{
    
    func locationupdated(_ address: GMSAddress, _ at:CLLocationCoordinate2D) {
        loader.setHidden(true, animated: true, completion:nil)
        textField.shouldShowLine = true
        self.address = address
        self.coordinate = at
    }
}


