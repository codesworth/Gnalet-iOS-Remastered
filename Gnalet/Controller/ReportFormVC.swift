//
//  ReportFormVC.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 30/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps.GMSAddress

class ReportFormVC: UIViewController {

    //MARK:- Init
    init(type:Report.Types) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    private var coordinate:CLLocationCoordinate2D?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var type:Report.Types = .general
    
    private lazy var generalForm:GeneralReportView = {
        let form = GeneralReportView(frame: .zero)
        return form
    }()
    
    private lazy var mapView:Mapview = { [unowned self] by in
        let map = Mapview(frame: view.frame, coordinate: coordinate!)
        return map
    }(())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(generalForm)
        generalForm.navigator = navigationControllerg
        subscribeTo(subscription: .launchMaps, selector: #selector(launchMaps(_:)))
        subscribeTo(subscription: .mapAdjustedCoordinates, selector: #selector(mapAdjustedCoordinates(_:)))
        generalForm.layout{
            $0.top == view.topAnchor
            $0.bottom == view.bottomAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Subscription.main.post(suscription: .removePickerIfPresent, object: nil)
    }
    
    
    
    @objc func launchMaps(_ notification:Notification){
        guard let coordinate = notification.userInfo?[.info] as? CLLocationCoordinate2D else {return}
        self.coordinate = coordinate
        view.addSubview(mapView)
    }
    
    @objc func mapAdjustedCoordinates(_ notification:Notification){
        guard let address = notification.userInfo?[.info] as? GMSAddress else {return}
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            self.mapView.alpha = 0
        }) { _ in
            self.mapView.removeFromSuperview()
            self.mapView.alpha = 1
        }
        generalForm.locationInput.address = address
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
