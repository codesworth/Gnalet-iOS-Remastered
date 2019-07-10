//
//  MapView.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 06/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import GoogleMaps
import MaterialComponents.MDCCard
import MaterialComponents.MDCButton

class Mapview:UIView{
    
    private var coordinate:CLLocationCoordinate2D!
    
    lazy var containerView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    lazy var googleMap:GMSMapView = { [unowned self] by in
        let camera = GMSCameraPosition(target: coordinate, zoom: 12)
        let map = GMSMapView.map(withFrame: containerView.bounds, camera: camera)
        return map
    }(())
    
    lazy var marker:GMSMarker = { [unowned self] by in
        let marker = GMSMarker(position: coordinate)
        let imgv = UIImageView(frame: [0,0,60,60])
        imgv.image = #imageLiteral(resourceName: "pin")
        marker.iconView = imgv
        return marker
    }(())
    
    private lazy var confirmLoc:MDCButton = {
        let card = MDCButton(frame: [bounds.midX - 70,bounds.maxY - 80,140,40])
        card.setTitle("Confirm", for: .normal)
        card.setTitleFont(.systemFont(ofSize: 16, weight: .medium), for: .normal)
        card.backgroundColor = .primary
        card.setElevation(ShadowElevation(4), for: .normal)
        card.layer.cornerRadius = 20
        card.addTarget(self, action: #selector(confirmLocation(_:)), for: .touchUpInside)
        return card
    }()
    
    let markerImage:UIImageView = {
        let imgv = UIImageView(frame: [0,0,60,60])
        imgv.image = #imageLiteral(resourceName: "pin")
        return imgv
    }()
    
    init(frame: CGRect, coordinate:CLLocationCoordinate2D) {
        super.init(frame: frame)
        self.coordinate = coordinate
        initialize()
    }
    
    private lazy var detailCard:DetailCard = {
        let height = UIScreen.height + 50
        let card  = DetailCard(frame: [0,height,UIScreen.width ,185])
        return card
    }()
    
    func initialize(){
        backgroundColor = .white
        clipsToBounds = true
        addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layout{
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
    }
    
    @objc func confirmLocation(_ sender: MDCButton){
        confirmLoc.isHidden = true
        GMSGeocoder().reverseGeocodeCoordinate(coordinate) { (response, err) in
            guard let result = response?.firstResult() else {return}
            self.detailCard.address = result
            self.addSubview(self.detailCard)
            self.detailCard.center.x = self.center.x
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
                self.detailCard.frame.origin.y -= 240
            }, completion: nil)
            self.detailCard.isShowing = true
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        containerView.addSubview(googleMap)
        googleMap.delegate = self
        googleMap.layout{
            $0.top == containerView.topAnchor
            $0.bottom == containerView.bottomAnchor
            $0.leading == containerView.leadingAnchor
            $0.trailing == containerView.trailingAnchor
        }
        marker.map = googleMap
        containerView.addSubview(markerImage)
        containerView.addSubview(confirmLoc)
        confirmLoc.isHidden = true
        markerImage.isHidden = true
        markerImage.center = [bounds.midX,bounds.midY]
        
    }
}



extension Mapview: GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        //markerImage.center = marker.groundAnchor
        mapView.clear()
        markerImage.isHidden = false
        confirmLoc.isHidden = false
        if detailCard.isShowing{
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
                self.detailCard.frame.origin.y += 240
            }, completion: nil)
            self.detailCard.isShowing = false
        }
        
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let position = position.target
        marker.position = position
        marker.map = googleMap
        markerImage.isHidden = true
        coordinate = position
    }
}
