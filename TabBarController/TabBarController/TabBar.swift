//
//  TabBar.swift
//  TabBarController
//
//  Created by Prasanna Kumar Joshi on 17/06/22.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    //MARK: - basic function to set color and call setupvc function so get tab bar.
    func setup(){
        
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }

   //MARK: - function to create tab nav with title and image and return UIViewController
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController{
        
        let navController = UINavigationController(rootViewController: rootViewController)
                navController.tabBarItem.title = title
                navController.tabBarItem.image = image
                navController.navigationBar.prefersLargeTitles = true
                rootViewController.navigationItem.title = title
                return navController
    }

   //MARK- : Function to to create three tabs by use of "createNavController" function.
    func setupVCs() {
           viewControllers = [
               createNavController(for: ViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
               createNavController(for: ViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
               createNavController(for: ViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
           ]
       }
}


//MARK: - BASIC STEPS
/*
 1. create project.
 2. add file as UITabBarController
 3. remove storyboard
 4. remove Main target from info.plist
 5. Go in Project(our project)->general->deployment->Main Interface(Select Launch screen their).
 6. create function createNavController with three param as "for rootViewContreoller", "title", "image".
 7. create setupVC to set number of tab in tab bar.
 8. setup function to set colors and call setupVC through viewDidLoad.
 */
