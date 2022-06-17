//
//  ViewController.swift
//  time-picker
//
//  Created by Prasanna Kumar Joshi on 03/06/22.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.register(UINib(nibName: "daysCell", bundle: nil), forCellReuseIdentifier: "daysCell")
        tblView.dataSource = self
        tblView.delegate = self
        tblView.reloadData()
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "daysCell", for: indexPath) as! daysCell
        return cell
    }
}

