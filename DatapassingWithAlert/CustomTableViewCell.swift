//
//  CustomTableViewCell.swift
//  DatapassingWithAlert
//
//  Created by Mac on 04/07/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLable: UILabel!
    
    @IBOutlet weak var RollnoLable: UILabel!
    
    @IBOutlet weak var CityLable: UILabel!
    
    @IBOutlet weak var PhoneLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
