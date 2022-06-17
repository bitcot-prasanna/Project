//
//  DataCell.swift
//  PaginationDummy
//
//  Created by admin on 06/05/22.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var imgAirline : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblAirlineName : UILabel!
    @IBOutlet weak var lblTrips : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
