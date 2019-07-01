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
        return lable
    }(())
    
    lazy var picker:UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 0, y: UIScreen.height + 50, width: UIScreen.width, height: 300))
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .white
        return picker
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
        UIApplication.window?.addSubview(picker)
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
            self.picker.frame.origin.y -= 350
        }, completion: nil)
    }
    
    
    
    
    
    func dismissPicker(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.picker.frame.origin.y += 350
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
        dismissPicker()
        //
    }
}
