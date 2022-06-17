//
//  ViewController.swift
//  FormWithAnimation
//
//  Created by Prasanna Kumar Joshi on 23/05/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var lblFormHeading: UILabel!
    @IBOutlet weak var constHeaderCenter: NSLayoutConstraint!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var constNameCenter: NSLayoutConstraint!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var constPasswordCenter: NSLayoutConstraint!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var constLoginCenter: NSLayoutConstraint!
    
    @IBOutlet weak var imgCloudOne: UIImageView!
    @IBOutlet weak var imgCloudTwo: UIImageView!
    @IBOutlet weak var imgCloudThree: UIImageView!
    @IBOutlet weak var imgCloudFour: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        constHeaderCenter.constant -= view.bounds.width
        constNameCenter.constant -= view.bounds.width
        constPasswordCenter.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateElements()
    }

}

extension HomeVC{
    func animateElements(){
        constHeaderCenter.constant = 0
        constNameCenter.constant = 0
        constPasswordCenter.constant = 0
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [], animations: {[weak self]
            in
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
}
