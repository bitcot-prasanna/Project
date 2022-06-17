//
//  DataManager.swift
//  RDX Play
//
//  Created by Dr.Mac on 20/09/21.
//

import Foundation


class DataManager{
    
    
    private static var sharedDataManger: DataManager = {
        let datamanager = DataManager()
        return datamanager
    }()
    
    
    class func shared() -> DataManager{
        return sharedDataManger
    }
    
    public var tabVC: TabBarController?
    
    public var timestamp = "\(Int(Date().timeIntervalSince1970))"
    
    public func randomNumber(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...4))"
        }
        return number
    }
//    func viewVideos(first:String,sectionId:String,seen:Int,seed:Double){
//
//    }
//
    
}
