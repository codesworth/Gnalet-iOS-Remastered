//
//  RegionPickerInput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class RegionPickerInput:UIView{
    
    //MARK:- Components
    private lazy var label:UILabel = { [unowned self] by in
        let lable = UILabel(frame: .zero)
        lable.font = .systemFont(ofSize: 18, weight: .medium)
        lable.textColor = .darkText
        lable.textAlignment = .left
        lable.text = "Select Region"
        lable.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(labletapped(_:)))
        tap.numberOfTapsRequired = 1
        lable.addGestureRecognizer(tap)
        return lable
    }(())
    
    lazy var picker:UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 40, width: UIScreen.width, height: 210))
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .white
        return picker
    }()
    
    private lazy var pickerContainer:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: UIScreen.height + 50, width: UIScreen.width, height: 250))
        
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var doneToolbar: UIToolbar = {
        return UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    }()
    
    lazy var flexSpace:UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }()
    lazy var  done:UIBarButtonItem = {
        return  UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissPicker))
    }()
    
    //MARK: - DECLS
    
    fileprivate let regions = Report.Regions
    fileprivate let regionCodes = Report.RegionCodes
    
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initialize(){
        addSubview(label)
        
        doneToolbar.barStyle = .default
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        pickerContainer.addSubview(doneToolbar)
        pickerContainer.addSubview(picker)
        UIApplication.window?.addSubview(pickerContainer)
    }
    
    //MARK: - LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.bottom == bottomAnchor
        }
    }
    
    //MARK:- SELECTOR
    @objc func labletapped(_ recognizer:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.pickerContainer.frame.origin.y -= 300
        }, completion: nil)
    }
    
    
    
    
    
    @objc func dismissPicker(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.pickerContainer.frame.origin.y += 300
        }, completion: nil)
    }
}



extension RegionPickerInput:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let region = regions[row]
        label.text = region
        //
    }
}
