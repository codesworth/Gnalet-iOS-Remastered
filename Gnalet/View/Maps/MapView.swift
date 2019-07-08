//
//  MapView.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 06/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import GoogleMaps
import MaterialComponents.MDCCard

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
        marker.icon = #imageLiteral(resourceName: "pin")
        return marker
    }(())
    
    let markerImage:UIImageView = {
        let imgv = UIImageView(frame: [0,0,50,50])
        return imgv
    }()
    
    init(frame: CGRect, coordinate:CLLocationCoordinate2D) {
        super.init(frame: frame)
        self.coordinate = coordinate
        initialize()
    }
    
    private lazy var detailCard:DetailCard = {
        let height = UIScreen.height + 50
        let card  = DetailCard(frame: [25,height,UIScreen.width - 25,140])
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
        
        containerView.addSubview(markerImage)
        markerImage.center = [bounds.midX,bounds.midY]
        
    }
}



extension Mapview: GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        markerImage.center.y += 20
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let postion = position.target
    }
}
