//
//  ViewController.swift
//  Example
//
//  Copyright © 2018 hajime-nakamura. All rights reserved.
//

import Photos
import UIKit
var isFromfrontCamera = true

protocol FilterRecordingDelegate: class {
    func finishRecording(_ videoURL: URL?)
}

final class FilterCameraVC: FilterCamViewController {
    @IBOutlet private var controlPanelView: UIView!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    @IBOutlet private var torchButton: UIButton!
    @IBOutlet private var recordButton: UIButton!
    weak var delegate: FilterRecordingDelegate!
    private let myFilters: [[CIFilter]] = [ [],
                                            [CIFilter(name: "CIPhotoEffectNoir")!],
                                            [CIFilter(name: "CIPhotoEffectInstant")!],
                                            [CIFilter(name: "CIPhotoEffectMono")!],
                                            [CIFilter(name: "CIPhotoEffectChrome")!],
                                            [CIFilter(name: "CIPhotoEffectFade")!],
                                            [CIFilter(name: "CIPhotoEffectProcess")!],
                                            [CIFilter(name: "CIPhotoEffectTonal")!],
                                            [CIFilter(name: "CIPhotoEffectTransfer")!],
                                            [CIFilter(name: "CISepiaTone")!],
                                            [CIFilter(name: "CIBumpDistortion")!],
                                            [CIFilter(name: "CIGaussianBlur")!],
                                            [CIFilter(name: "CIPixellate")!],
                                            [CIFilter(name: "CITwirlDistortion")!],
                                            [CIFilter(name: "CIUnsharpMask")!],
                                            [CIFilter(name: "CIVignette")!],
                                            [CIFilter(name: "CIColorInvert")!]
    ]
    
    override func viewDidLoad() {
//        devicePosition = .front
//        videoQuality = .low
        super.viewDidLoad()
        if isFromfrontCamera{
            devicePosition =   AVCaptureDevice.Position.front
        }else{
            devicePosition =   AVCaptureDevice.Position.back
        }
        cameraDelegate = self
        shouldShowDebugLabels = true
        
    }
    func toggleCamera(){
        if isFromfrontCamera{
            devicePosition =   AVCaptureDevice.Position.front
        }else{
            devicePosition =   AVCaptureDevice.Position.back
        }
    }

    private func saveVideoToPhotos(_ url: URL) {
        let save = {
            PHPhotoLibrary.shared().performChanges({ PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url) }, completionHandler: { _, _ in
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: url.path) {
                    try? fileManager.removeItem(at: url)
                }
            })
        }
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    save()
                }
            }
        } else {
            save()
        }
    }

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        filters = myFilters[sender.selectedSegmentIndex]//[sender.selectedSegmentIndex]
    }

    @IBAction func torchButtonAction(_ sender: UIButton) {
        torchLevel = sender.isSelected ? 0 : 1
        sender.isSelected = !sender.isSelected
    }

    @IBAction func recordButtonAction(_ sender: UIButton) {
        sender.isSelected ? stopRecording() : startRecording()
        sender.isSelected = !sender.isSelected
    }
}

extension FilterCameraVC: FilterCamViewControllerDelegate {
    func filterCamDidStartRecording(_: FilterCamViewController) {
        
        print("timeOld-\(Date())")
        
    }

    func filterCamDidFinishRecording(_: FilterCamViewController) {
        print("timeOld-\(Date())")
        showHud()
    }

    func filterCam(_: FilterCamViewController, didFinishWriting outputURL: URL) {
        //saveVideoToPhotos(outputURL)
        print("time-\(Date())")
        hideHud()
        delegate.finishRecording(outputURL)
        
    }

    func filterCam(_: FilterCamViewController, didFocusAtPoint _: CGPoint) {
        
    }
    func filterCam(_: FilterCamViewController, didFailToRecord _: Error) {

    }
}
