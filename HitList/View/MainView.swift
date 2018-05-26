//
//  mainView.swift
//  HitList
//
//  Created by Dagmawi Nadew-Assefa on 5/26/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class MainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let viewTableView : UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    func setupView() {
        
        addSubview(viewTableView)
        viewTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        viewTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        viewTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
