//
//  ViewController.swift
//  PaginationDummy
//
//  Created by admin on 06/05/22.
//

import UIKit
import SDWebImage

class PaginatedVC: UIViewController {
    
    @IBOutlet weak var tblPaginated : UITableView!
    
    //MARK: - Defining api paramerters
    var pageNo:Int=0
    var limit:Int=10
    
    //MARK: - Declaring variable of model type which stores data
    var airlineData = [PaginationMain]()
    let defaultIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerAndGetAirData()
        // Do any additional setup after loading the view.
    }
}

//MARK: - 1. basic configuration
extension PaginatedVC{
    // called in View Did Load function
    private func registerAndGetAirData(){
        //defining row height of table view
        tblPaginated.rowHeight = UITableView.automaticDimension
        tblPaginated.estimatedRowHeight = 150
        //calling api function
        getAirlineData(limit: self.limit)
        //registering table view cell and assign DS and delegate
        tblPaginated.register(UINib.init(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        tblPaginated.dataSource = self
        tblPaginated.delegate = self
    }
    
    //configure loader with positioning in footer
    private func footerSpinner() -> UIView{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        spinner.color = UIColor.init("#3ba1c5")
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}
//MARK: - table view ds and delegation methods
extension PaginatedVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tblPaginated.rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.airlineData.count == 0 ? 0 : self.airlineData[defaultIndex].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataCell
        let airlineObjWithIndex = self.airlineData[defaultIndex].data[indexPath.row]
        cell.imgAirline.sd_setImage(with: URL(string: airlineObjWithIndex.airline[defaultIndex].logo), placeholderImage: nil)
        cell.lblName.text = airlineObjWithIndex.name
        cell.lblAirlineName.text = airlineObjWithIndex.airline[defaultIndex].name
        cell.lblTrips.text = airlineObjWithIndex.trips.description
        return cell
    }
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
        if ((tblPaginated.contentOffset.y + tblPaginated.frame.size.height) >= tblPaginated.contentSize.height)
        {
            if self.limit <= airlineData[defaultIndex].totalPassengers{
                self.pageNo=self.pageNo+1
                self.limit += 10
                getAirlineData(limit: self.limit)
            }
            
        }
        
    }
}
//MARK: - defining function to call api
extension PaginatedVC{
    func getAirlineData(limit : Int){
        let parameter : [String : Any] = ["page":self.pageNo,"size":limit]
        self.tblPaginated.tableFooterView = footerSpinner()
        Networking.shared.getData(parameter: parameter){ (data, error) in
            if let tempData = data{
                let jsonDecoder = JSONDecoder()
                let result = try! jsonDecoder.decode(PaginationMain.self, from: tempData)
                self.airlineData = [result]
                DispatchQueue.main.async {
                    self.tblPaginated.tableFooterView = nil
                    self.tblPaginated.reloadData()
                }
            }
        }
    }
}
