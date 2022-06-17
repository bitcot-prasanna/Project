//
//  VideoCell.swift
//  VideoDownloader
//
//  Created by apple on 12/05/22.
//

import UIKit

protocol btnCellIndex: class{
    func cellIndex(tag: Int)
    func didTapOnButton(cell: UITableViewCell)
}
class VideoCell: UITableViewCell {
    
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnAction: UIButton!
    
    weak var delegate : btnCellIndex?
    var download : (()->()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAction.setTitle("Downloads", for: UIControl.State.normal)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension VideoCell{
    
    @IBAction func btnDownloadTapped(_ sender : UIButton){
        delegate?.didTapOnButton(cell: self)
    }
}
