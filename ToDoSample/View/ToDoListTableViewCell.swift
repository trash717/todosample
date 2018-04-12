//
//  ToDoListTableViewCell.swift
//  ToDoSample
//
//  Created by onishi on 2016/06/01.
//  Copyright © 2016年 Kronos. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
