//
//  TodoCell.swift
//  TodoRenewal
//
//  Created by 松下慶大 on 2016/05/23.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setPriorityView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPriorityView() {
        priorityView.layer.cornerRadius = priorityView.frame.width / 2
        priorityView.layer.masksToBounds = true
    }
    
}
