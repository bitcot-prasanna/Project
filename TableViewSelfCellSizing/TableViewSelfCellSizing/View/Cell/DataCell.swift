//
//  DataCell.swift
//  TableViewSelfCellSizing
//
//  Created by Prasanna Kumar Joshi on 20/05/22.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var imgUser:UIImageView!
    @IBOutlet weak var lblDesc:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
