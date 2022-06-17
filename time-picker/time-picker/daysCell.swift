//
//  daysCell.swift
//  time-picker
//
//  Created by Prasanna Kumar Joshi on 03/06/22.
//

import UIKit

class daysCell: UITableViewCell {

    @IBOutlet weak var datepickerView:UIDatePicker!
    @IBOutlet weak var btnPicker:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        datepickerView.locale = .current
        datepickerView.date = Date()
        datepickerView.preferredDatePickerStyle = .compact
        datepickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnPressed(_ sender: UIButton){
        switch sender.tag{
        case 1:
            datepickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        default:
            return
        }
    }
    @objc
    func dateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datepickerView.date)
        btnPicker.setTitle("\(date)", for: .normal)
    }
}
