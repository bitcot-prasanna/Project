//
//  PostNotificationCenterVC.swift
//  NotificationCenter
//
//  Created by Prasanna Kumar Joshi on 20/05/22.
//

import UIKit

class PostNotificationCenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - action perform to pop to back with notify post.
    @IBAction func btnColorTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
        switch sender.tag {
          case 0:
            NotificationCenter.default.post(name: Notification.Name("notificationRed"), object: nil, userInfo: ["tag": sender.tag])
          case 1:
            NotificationCenter.default.post(name: Notification.Name("notificationYellow"), object: nil, userInfo: ["tag": sender.tag])
          case 2:
            NotificationCenter.default.post(name: Notification.Name("notificationOrange"), object: nil, userInfo: ["tag": sender.tag])
          case 3:
            NotificationCenter.default.post(name: Notification.Name("notificationGreen"), object: nil, userInfo: ["tag": sender.tag])
          default:
            break
          }
    }

}
