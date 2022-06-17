//
//  ViewController.swift
//  VideoDownloader
//
//  Created by apple on 12/05/22.
//

import UIKit
import Alamofire

enum DownloadStatus: String {
    case start, stop, waiting, inProgress
}

class VideoDownload {
    
    var videoProgess: Float?
    var status: DownloadStatus?
    var downloadURL: URL?
    var videoTitle: String?
    var videoThumbnAIl: URL?
    
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var tblVideoList: UITableView!
    
    var btnTappedIndex:Int!
    var activeCell:Int!
    var progressShow:Float = 0.0
    var btnTitleText = "Downloads"
    var arrVideoData = [VideoDownload]()
    var dictVideoData = [String:Any]()
    var arrDownloadedVideo = [String]()
    var activeVideoDownload = [VideoDownload]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVideoList.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        self.createFileDirectory()
        self.linkCreation()
        // Do any additional setup after loading the view.
    }
}

//MARK: - Table view DS and Delegate
extension HomeVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrVideoData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVideoList.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let dataExtract = arrVideoData[indexPath.row]
        //cell.btnAction.tag = indexPath.row
        cell.lblTitle.text = dataExtract.videoTitle
        cell.delegate = self
//        cell.download = {
//            self.downloadVideo()
//        }
//
        cell.progressBar.progress = dataExtract.videoProgess ?? 0.0
        cell.btnAction.setTitle(dataExtract.status?.rawValue, for: UIControl.State.normal)
        return cell
    }
}


//MARK: Download video network call
extension HomeVC{
    func downloadVideo(){
        if self.progressShow == 0.0{
            self.activeCell = self.btnTappedIndex //assign once for each cell
            let dataExtract = arrVideoData[self.activeCell] as! [String:Any]
            let urlData = dataExtract["urlData"] as! String
            let title = "Video\((dataExtract["indexNumber"] as! Int)+1)"
            let destination: DownloadRequest.Destination = { _, _ in
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("VideoDownloaderApp")
                let fileURL = documentsURL.appendingPathComponent(title).appendingPathExtension("mp4")
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }
            let download =  AF.download(urlData, to: destination)
            download.downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
                self.progressShow = Float(progress.fractionCompleted)
                self.btnTitleText = "Stop"
                self.updateRowWithProgressBar()
                
            }.response{ response in
                print("Response Data::::::",response)
                if response.error == nil, let imagePath = response.fileURL?.path {
                    print(imagePath)
                    self.btnTitleText = "Delete"
                    self.updateRowWithProgressBar()
                    self.progressShow = 0.0
                    self.arrDownloadedVideo.append(title)
                }
            }
            
        }else if self.progressShow > 0.0 && self.activeCell != self.btnTappedIndex{
            self.notificationAlert(alertTitle: "Warning!!!", btnActionText: "OK", Message: "Another video downloading is in progress. please wait.......")
        }
        
    }
}


//MARK: - create app directory to store videos
extension HomeVC{
    func createFileDirectory() {
        let documentsURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let folderURL = documentsURL.appendingPathComponent("VideoDownloaderApp")
        do
        {
            if !FileManager.default.fileExists(atPath: folderURL.path){
                try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
            }
        }
        catch let error as NSError
        {
            NSLog("Unable to create directory \(error.debugDescription)")
        }
    }
}

//MARK: - define data to get
extension HomeVC{
    func linkCreation(){
        let arrURL = ["https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"]
        for (index, url) in arrURL.enumerated() {
//            self.dictVideoData["indexNumber"] = index
//            self.dictVideoData["title"] = "Title \(index + 1)"
//            self.dictVideoData["urlData"] = arrURL[index]
//            self.arrVideoData.append(dictVideoData)
            let videoDownload = VideoDownload()
            videoDownload.downloadURL = URL(string: url)
            arrVideoData.append(videoDownload)
        }
        print(arrVideoData)
    }
}

//MARK: -Basic utilities
extension HomeVC : btnCellIndex{
   
    func didTapOnButton(cell: UITableViewCell) {
        if let indexPath = tblVideoList.indexPath(for: cell) {
            let video = arrVideoData[indexPath.row]
            if let index = activeVideoDownload.firstIndex(where: {$0.videoTitle == video.videoTitle}) {
                activeVideoDownload.remove(at: index)
            }else {
                activeVideoDownload.append(video)
            }
        }
    }
    
    //get tag number to download specific video
    func cellIndex(tag: Int) {
        self.btnTappedIndex = tag
    }
    //update individual rows
    func updateRowWithProgressBar(){
        self.tblVideoList.reloadRows(at: [IndexPath(item: self.activeCell, section: 0)], with: .none)
    }
    //alert definition
    func notificationAlert(alertTitle:String,btnActionText:String,Message: String){
        let alert = UIAlertController(title: alertTitle, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnActionText, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
