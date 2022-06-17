//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Prasanna Kumar Joshi on 20/05/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var lblTitle:UILabel!
    
   //constant for passing keys
    let redKey = "notificationRed"
    let yellowKey = "notificationYellow"
    let orangeKey = "notificationOrange"
    let greenKey = "notificationGreen"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createObserver()
    }
    //destructer to remove observer
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: - define observer
extension HomeVC{
    // creating observer
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateObserver(_ :)), name: NSNotification.Name(rawValue: redKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateObserver(_ :)), name: NSNotification.Name(rawValue: yellowKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateObserver(_ :)), name: NSNotification.Name(rawValue: orangeKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateObserver(_ :)), name: NSNotification.Name(rawValue: greenKey), object: nil)
    }
    
   //selecter function to perform oberving activity
    @objc func updateObserver(_ notification: NSNotification){
        if let tag = notification.userInfo?["tag"] as? Int{
            switch tag{
            case 0:
                view.backgroundColor = .red
                lblTitle.text = "Red Button Clicked"
                lblTitle.textColor = .white
            case 1:
                view.backgroundColor = .yellow
                lblTitle.text = "Yellow Button Clicked"
                lblTitle.textColor = .white
            case 2:
                view.backgroundColor = .orange
                lblTitle.text = "Orange Button Clicked"
                lblTitle.textColor = .white
            case 3:
                view.backgroundColor = .green
                lblTitle.text = "Grren Button Clicked"
                lblTitle.textColor = .white
            default:
                print("Not a valid tag")
                view.backgroundColor = .white
                lblTitle.text = "Observer Example!!!!"
                lblTitle.textColor = .black
            }
        }
    }
}

//MARK: - navigate to next VC
extension HomeVC{
    @IBAction func btnNextTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostNotificationCenterVC") as! PostNotificationCenterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
