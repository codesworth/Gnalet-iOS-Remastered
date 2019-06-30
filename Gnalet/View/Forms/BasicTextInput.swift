//
//  BasicTextInput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 30/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class BasicTextInput: UIView {
    private let paddingH:CGFloat = 12
    
    private lazy var label:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkText
        return label
    }()
    
    var topConstraint:NSLayoutConstraint!
    
    var placeholder:String = ""{
        didSet{
            label.text = placeholder
            textField.placeholder = placeholder
        }
    }
    
    private lazy var textField:UITextField = {
        let txtfield = UITextField(frame: .zero)
        txtfield.borderStyle = .none
        txtfield.font = .systemFont(ofSize: 16, weight: .regular)
        return txtfield
    }()
    
    private lazy var line:UIView = {
        let line = UIView(frame: .zero)
        line.backgroundColor = .black
        line.clipsToBounds = true
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func initialize(){
        backgroundColor = .white
        addSubview(textField)
        addSubview(label)
        addSubview(line)
        label.alpha = 0
        textField.delegate = self
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        line.layout{
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor + paddingH
            $0.trailing == trailingAnchor - paddingH
            $0.height |=| 1
        }
        textField.layout{
            $0.leading == leadingAnchor + paddingH
            $0.trailing == trailingAnchor - paddingH
            $0.bottom == line.topAnchor
            $0.height |=| 40
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 50)
        let leadConstraint = label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingH)
        NSLayoutConstraint.activate([topConstraint,leadConstraint])
    }

}


extension BasicTextInput:UITextFieldDelegate{
    
    private func textBeganAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.label.alpha = 1.0
            self.topConstraint.constant = 4
        }, completion: nil)
    }
    
    private func textEndedAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.label.alpha = 0.0
            self.topConstraint.constant = 50
        }, completion: nil)
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return true}
        if !string.isEmpty && text.isEmpty{
            textBeganAnimation()
        }
        if string.isEmpty && text.count == 1{
           textEndedAnimation()
        }
        return true
        
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        print("Ended at: \(textField.text)")
//    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        guard let text = textField.text else {return}
//        if text == ""{
//            textBeganAnimation()
//        }
//    }
    
    
}
