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
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkText
        label.text = "Decription"
        return label
    }()
    
    private lazy var line:UIView = {
        let line = UIView(frame: .zero)
        line.backgroundColor = .black
        line.clipsToBounds = true
        return line
    }()
    
    private lazy var textView:UITextView = {
        let view = UITextView(frame: .zero)
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textColor = .darkText
        view.textAlignment = .left
        return view
    }()
    
    
    //MARK: - DECLS
    var topConstraint:NSLayoutConstraint!
    var heightConstraint:NSLayoutConstraint!
    
    var descriptionText:String{
        return textView.text
    }
    
    var placeholder:String = .empty{
        didSet{
            label.text = placeholder
            
        }
    }
    
//    func increaseHeight(){
//        heightConstraint.constant += 25
//    }
    
    //MARK:- INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private var height:CGFloat = 40
    private func initialize(){
        addSubview(textView)
        addSubview(label)
        addSubview(line)
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        line.layout{
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor + paddingH
            $0.trailing == trailingAnchor - paddingH
            $0.height |=| 1
        }
        
        textView.layout{
            $0.leading == leadingAnchor + paddingH
            $0.trailing == trailingAnchor - paddingH
            $0.bottom == line.topAnchor
           
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        let leadConstraint = label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingH)
        NSLayoutConstraint.activate([topConstraint,leadConstraint])
    }
    
}



