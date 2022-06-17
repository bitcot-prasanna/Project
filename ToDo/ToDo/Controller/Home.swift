//
//  ViewController.swift
//  ToDo
//
//  Created by Prasanna Kumar Joshi on 13/06/22.
//

import UIKit
import EmptyStateKit

class Home: UIViewController {

    @IBOutlet weak var tblData:UITableView!
    @IBOutlet weak var btnAdd:UIButton!
    
    var arrData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setup()
    }

    func setup(){
        
        self.setupTableView()
        view.emptyState.delegate = self
        view.emptyState.show(State.noData)
        view.emptyState.format.buttonColor = UIColor.app_yellow!
        self.btnAdd.isUserInteractionEnabled = false
        self.btnAdd.addTarget(self, action: #selector(btnAddTapped(_:)), for: .touchUpInside)
    }
    func setupTableView(){
        
        tblData.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
    }
    
    @objc func btnAddTapped(_ sender: UIButton){
        
            let addNewName = self.storyboard?.instantiateViewController(withIdentifier: "AddDataViewController") as! AddDataViewController
            addNewName.modalTransitionStyle = .crossDissolve
            addNewName.modalPresentationStyle = .overFullScreen
            addNewName.delegate = self
            self.present(addNewName, animated: true)
    }
}

//MARK: -table view DS and delegate methods
extension Home: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblData.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.configuration(name: arrData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Confirmation", message: "Do you really want to delete name?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_
            in
            self.arrData.remove(at: indexPath.row)
            self.tblData.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            if self.arrData.isEmpty{
                
                self.btnAdd.isUserInteractionEnabled = false
                self.view.emptyState.show(State.noData)
            }
            self.tblData.reloadData()
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
}

//MARK: -Setup empty screen
extension Home:EmptyStateDelegate, AddDataDelegate{
    
    func addName(name: String) {
        self.arrData.append(name)
        self.btnAdd.isUserInteractionEnabled = true
        self.tblData.reloadData()
    }
    
    
    func emptyState(emptyState: EmptyState, didPressButton button: UIButton) {
        view.emptyState.hide()
        let addNewName = self.storyboard?.instantiateViewController(withIdentifier: "AddDataViewController") as! AddDataViewController
        addNewName.modalTransitionStyle = .crossDissolve
        addNewName.modalPresentationStyle = .overFullScreen
        addNewName.delegate = self
        self.present(addNewName, animated: true)
    }
    
    
    
}

