//
//  VehicularReport.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 10/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//


import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialDialogs

class VehicularReportView: UIView {
    
    // MARK:- Components
    
    private let marginVertical:CGFloat = 24
    
    var category:String?
    
    private lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounces = true
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    weak var navigator:UINavigationController?
    
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
    
    lazy var locationInput:LocationTextinput = {
        let loca = LocationTextinput(frame: .zero)
        loca.placeholder = "Location"
        return loca
    }()
    
    private lazy var vehicleNumber:BasicTextInput = {
        let text = BasicTextInput(frame: .zero)
        text.placeholder = "Vehicle Number"
        text.textPlaceHolder = "Vehicle Number"
        return text
    }()
    
    private lazy var vehicleBrand:BasicTextInput = {
        let text = BasicTextInput(frame: .zero)
        text.placeholder = "Vehicle Brand"
        text.textPlaceHolder = "Vehicle Brand"
        return text
    }()
    
    private lazy var vehicleColor:BasicTextInput = {
        let text = BasicTextInput(frame: .zero)
        text.placeholder = "Vehicle Color"
        text.textPlaceHolder = "Vehicle Color"
        return text
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
        let button =  MDCButton(frame: .zero)
        button.setTitle("SUBMIT", for: .normal)
        button.backgroundColor = .primary
        button.setTitleColor(.white, for: .normal)
        button.setElevation(ShadowElevation(4), for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var reporterField:BasicTextInput = {
        let text = BasicTextInput(frame: .zero)
        text.placeholder = "Reporter"
        text.textPlaceHolder = "Reporter"
        return text
    }()
    
    var locheight:CGFloat = 38
    private var descHeight:NSLayoutConstraint!
    
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
        contentView.addSubview(vehicleNumber)
        contentView.addSubview(vehicleBrand)
        contentView.addSubview(vehicleColor)
        contentView.addSubview(descriptionInput)
        contentView.addSubview(regionPicker)
        contentView.addSubview(reporterField)
        contentView.addSubview(submitbutton)
        NotificationCenter.default.addObserver(self, selector: #selector(increaseHeight(_:)), name: UITextView.textDidChangeNotification, object: nil)
        submitbutton.addTarget(self, action: #selector(submitReport), for: .touchUpInside)
        registerForKeyboardNotifications()
    }
    
    @objc func increaseHeight(_ notification:Notification){
        guard let textview = notification.object as? UITextView else {return}
        let height = textview.text.height(withConstrainedWidth: UIScreen.width - 40, font: .systemFont(ofSize: 16, weight: .regular))
        print("The height is: \(height)j")
        if height > self.locheight{
            self.descHeight.constant += 25
            locheight = height
        }
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
            $0.height |=| 960
        }
        
        imagePickerView.layout{
            $0.top == contentView.topAnchor + 20
            $0.centerX == contentView.centerXAnchor
            $0.width |=| 250
            $0.height |=| 200
            
        }
        emmergencylable.layout{
            $0.top == imagePickerView.bottomAnchor + marginVertical
            $0.centerX == contentView.centerXAnchor
        }
        
        locationInput.layout{
            $0.top == emmergencylable.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 60
        }
        
        vehicleNumber.layout{
            $0.top == locationInput.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 60
        }
        
        vehicleBrand.layout{
            $0.top == vehicleNumber.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 60
        }
        
        vehicleColor.layout{
            $0.top == vehicleBrand.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 8
            $0.trailing == contentView.trailingAnchor - 8
            $0.height |=| 60
        }
        
        let top = descriptionInput.topAnchor.constraint(equalTo: vehicleColor.bottomAnchor, constant: marginVertical)
        let leading = descriptionInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        let trailing = descriptionInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        descHeight = descriptionInput.heightAnchor.constraint(equalToConstant: 60)
        descriptionInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([top,leading,trailing,descHeight])
        
        regionPicker.layout{
            $0.top == descriptionInput.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 16
            $0.trailing == contentView.trailingAnchor - 16
            $0.height |=| 60
        }
        
        reporterField.layout{
            $0.top == regionPicker.bottomAnchor + marginVertical
            $0.leading == contentView.leadingAnchor + 16
            $0.trailing == contentView.trailingAnchor - 16
            $0.height |=| 60
        }
        
        submitbutton.layout{
            $0.top == reporterField.bottomAnchor + marginVertical
            $0.centerX == contentView.centerXAnchor
            $0.height |=| 40
            $0.width |=| 160
        }
    }
    
    
    //MARK:- SELECTORS
    
    @objc func submitReport(){
        let coordinator = ReportCoordinator()
        if let region = regionPicker.region, let locdat = locationInput.getLocationData(),let cat = category{
            let report = coordinator.compose(category: cat, address: locdat.address, coordinate: locdat.coordinate, reporter: reporterField.text, region: region, extras: nil, reporterId: AppService.uid, reportDescription: descriptionInput.descriptionText)
            let dialog = MDCAlertController(title: "Confirm Report", message: "Please confirm details and location of report are accurate")
            let action = MDCAlertAction(title: "ADJUST", emphasis: .medium, handler: nil)
            let action2 = MDCAlertAction(title: "CONFIRM", emphasis: .high) { _ in
                AppService.uploadReport(report: report, image: self.imagePickerView.image, category: cat) { (sucess, err) in
                    if sucess{
                        let snack = MDCSnackbarMessage(text: "Report was succesfully submitted")
                        self.navigator?.popToRootViewController(animated: true)
                        MDCSnackbarManager.default.show(snack)
                    }
                }
            }
            dialog.addAction(action)
            dialog.addAction(action2)
            navigator?.present(dialog, animated: true, completion: nil)
        }
        
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // Don't forget to unregister when done
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification){
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else {return}
        let size = keyboardSize.size
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        scrollView.contentInset = inset
        scrollView.scrollIndicatorInsets = inset
    }
    
    @objc func keyboardWillHide(_ notification:Notification){
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
}
