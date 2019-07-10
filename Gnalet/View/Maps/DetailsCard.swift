//
//  DetailsCard.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 08/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import MaterialComponents.MDCCard
import GoogleMaps.GMSAddress



class DetailCard:MDCCard{
    
    private lazy var header:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Location Details"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var headerLine:MDCCard = {
        let line = MDCCard(frame: .zero)
        line.isInteractable = false
        line.backgroundColor = .gray
        line.setShadowElevation(ShadowElevation(rawValue: 5), for: .normal)
        line.cornerRadius = 0
        return line
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
    }(())
    
    private lazy var longLable:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        return label
        
    }()
    
    var isShowing = false
    
    
    var address:GMSAddress?{
        didSet{
            guard let coordinate = address?.coordinate, let line = address?.lines?.first, let country = address?.country else {return}
            adrressLine.text = "Location: \(line.replacingOccurrences(of: country, with: ""))"
            latLabel.text = "Latitude: \(coordinate.latitude)"
            longLable.text = "Longitude: \(coordinate.longitude)"
        }
    }
    
    
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
        addSubview(header)
        addSubview(headerLine)
        addSubview(adrressLine)
        addSubview(latLabel)
        addSubview(longLable)
        addSubview(confirmButt)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        header.layout{
            $0.top == topAnchor + 8
            $0.leading == leadingAnchor + 8
        }
        headerLine.layout{
            $0.top == header.bottomAnchor + 6
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.height |=| 1
        }
    
        adrressLine.layout{
            $0.top == headerLine.bottomAnchor + 8
            $0.leading == leadingAnchor + 8
            $0.trailing == trailingAnchor - 8
            
        }
        
        latLabel.layout{
            $0.top == adrressLine.bottomAnchor + 8
            $0.leading == leadingAnchor + 8
            $0.trailing == trailingAnchor - 8
        }
        
        longLable.layout{
            $0.top == latLabel.bottomAnchor + 8
            $0.leading == leadingAnchor + 8
            $0.trailing == trailingAnchor - 8
        }
        
        confirmButt.layout{
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.height |=| 50
        }
    }
    
    
    
    
    //MARK: - SELECTORS
    
    @objc func locationConfirmed(_ sender:UIButton){
        Subscription.main.post(suscription: .mapAdjustedCoordinates, object: address)
    }
    
    
}
