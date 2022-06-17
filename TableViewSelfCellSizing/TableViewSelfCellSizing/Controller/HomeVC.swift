//
//  ViewController.swift
//  TableViewSelfCellSizing
//
//  Created by Prasanna Kumar Joshi on 20/05/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tblData:UITableView!
    
    // defining array and dictionary to hold data of table cell
    var arrData = [Any]()
    var dictData = [String:Any]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        regiterCellWithUtility()
    }
}

//MARK: - table view methods
extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tblData.rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        if let dataExtract = arrData[indexPath.row] as? [String:Any]{
            cell.imgUser.image = UIImage(named: dataExtract["img"] as! String)
            cell.lblDesc.text = dataExtract["Description"] as? String
        }
        return cell
    }
}

//MARK: - auto height and data definition.
extension HomeVC{
    func autoHeight(){
        self.tblData.rowHeight = UITableView.automaticDimension
        self.tblData.estimatedRowHeight = 300
    }
    func dataDefinition(){
        let arrStrCarrying = [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Curabitur tincidunt quam vel odio hendrerit, ut rhoncus tellus bibendum. Phasellus massa erat, porta et mattis quis, finibus sed ex. Integer non odio eget augue congue accumsan eu a tortor.",
            "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras imperdiet malesuada faucibus. Maecenas cursus placerat ante, accumsan rhoncus libero.",
            "Pellentesque pharetra commodo magna porta volutpat. Nulla id porttitor diam. Aliquam posuere mattis accumsan. Morbi pretium id ex eget condimentum. Aenean arcu justo, accumsan vitae dictum id, rhoncus sit amet velit. Vestibulum quis laoreet urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla condimentum ultrices mi eu malesuada. Cras nulla ante, venenatis ac aliquet eu, suscipit id nisi. Donec efficitur ex in tortor viverra dapibus. Fusce mattis varius neque feugiat ornare. Nunc ut fermentum arcu. Proin",
            "Pellentesque pharetra commodo magna porta volutpat. Nulla id porttitor diam. Aliquam posuere mattis accumsan. Morbi pretium id ex eget condimentum. Aenean arcu justo, accumsan vitae dictum id, rhoncus sit amet velit. Vestibulum quis laoreet urna.",
            " Mauris commodo, enim ut feugiat tempor, leo felis euismod nibh, non tincidunt justo urna id justo. In iaculis maximus est, at bibendum nibh vehicula vel. Duis a tristique lorem."
        ]
        for index in 0..<arrStrCarrying.count{
            dictData["img"] = "imgt\(index)"
            dictData["Description"] = arrStrCarrying[index]
            arrData.append(dictData)
        }
    }
}

//MARK: -register and aut hright cell with static data load
extension HomeVC{
    func regiterCellWithUtility(){
        tblData.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        self.autoHeight()
        self.dataDefinition()
    }
}
