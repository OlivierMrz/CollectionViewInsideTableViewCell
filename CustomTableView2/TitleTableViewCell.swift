//
//  TitleTableViewCell.swift
//  CustomTableView2
//
//  Created by Olivier school on 07/06/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
