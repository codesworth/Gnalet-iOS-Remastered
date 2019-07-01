//
//  IssueSelectVC.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class IssueSelectVC: UIViewController {
    
    private lazy var tableView:UITableView = {
        let tab = UITableView(frame: .zero)
        tab.backgroundColor = .clear
        tab.separatorStyle = .none
        tab.register(UINib(nibName: "\(CategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(CategoryCell.self)")
        return tab
    }()
    
    var header:String = ""
    private var categories = Category.allCategories

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = header
        view.addSubview(tableView)
        tableView.layout{
            $0.top == view.topAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
            $0.bottom == view.bottomAnchor
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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



extension IssueSelectVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryCell.self)", for: indexPath) as? CategoryCell{
            let category = categories[indexPath.row]
            cell.configureView(category)
            return cell
        }
        
        return CategoryCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = categories[indexPath.row]
        let vc = ReportFormVC(type: .general)
        vc.navigationItem.title = cat.header
        navigationController?.pushViewController(vc, animated: true)
    }
}
