//
//  DataCell.swift
//  ToDo
//
//  Created by Prasanna Kumar Joshi on 13/06/22.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var lblName:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration(name: String){
        
        self.lblName.text = name
    }
}
