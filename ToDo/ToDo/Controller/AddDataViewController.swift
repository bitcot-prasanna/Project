//
//  AddDataViewController.swift
//  ToDo
//
//  Created by Prasanna Kumar Joshi on 15/06/22.
//

import UIKit

protocol AddDataDelegate{
    
    func addName(name: String)
}

class AddDataViewController: UIViewController {

    @IBOutlet weak var tfName:UITextField!
    
    var delegate:AddDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddTapped(_ sender: UIButton){
        
        if self.tfName.text != ""{
            
            delegate?.addName(name: self.tfName.text ?? "")
            self.dismiss(animated: true)
        }else{
            
            let alert = UIAlertController(title: "Warning", message: "Please enter a name to add...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}
