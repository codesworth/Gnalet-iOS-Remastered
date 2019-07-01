//
//  TextViewInput.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 30/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class TextViewInput:UIView{
    
    private let paddingH:CGFloat = 12
    
    private lazy var label:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkText
        return label
    }()
    
    private lazy var textView:UITextView = {
        let view = UITextView(frame: .zero)
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .darkText
        view.textAlignment = .left
        return view
    }()
    
    var topConstraint:NSLayoutConstraint!
    
    var placeholder:String = .empty{
        didSet{
            label.text = placeholder
            
        }
    }
    
    
}
