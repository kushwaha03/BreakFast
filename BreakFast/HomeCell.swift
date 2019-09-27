//
//  HomeCell.swift
//  BreakFast
//
//  Created by karmaa lab on 27/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet var addItmBtn: UIButton!
    
    @IBOutlet var nmLbl: UILabel!
    @IBOutlet var addItmImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addItmBtn.layer.cornerRadius = 10.0
        addItmBtn.layer.borderWidth = 1;
        addItmBtn.layer.borderColor = #colorLiteral(red: 0, green: 0.6850365996, blue: 0.9128597379, alpha: 1);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
