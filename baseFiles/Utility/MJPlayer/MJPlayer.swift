//
//  MJPlayer.swift
//  Copyright © 2020 IPhone. All rights reserved.
//

import UIKit

class MJPlayer: UIView {
    
    
    var playerLayer:  LLVideoPlayer?
    var volume: Float {
        get {
            return self.playerLayer!.volumn
        }set {
            self.playerLayer?.setVideoVolumn(newValue)
        }
    }
    var isMute: Bool {
        get {
            return (self.playerLayer?.volumn == 0.0) ? true : false
        }
        set {
            if newValue{ self.playerLayer?.setVideoVolumn(0.0) }
            else{self.playerLayer?.setVideoVolumn(1.0) }
        }
    }
         
    lazy var isPlayerShouldPlay = true
    lazy var isReplay = false
    var readyForDisplay:(()->(Void))?
    var isFailToLoading:(()->(Void))?
    var isDidStartVideo:(()->(Void))?
    var isDidEndVideo:(()->(Void))?
    var aTotalVideoDuration:((_ aDuration:NSNumber)->(Void))?
    var aCurrentVideoTime:((_ aTime:TimeInterval)->(Void))?
    var aCurrentVideoTimeVLC:(( _ aDuration:NSNumber,_ aTime:TimeInterval)->(Void))?
    var aShowLoader:((_ isShow:Bool)->(Void))?
    
  

    // MARK: - Lifecycle
    override static var layerClass: AnyClass {
        return CALayer.self;
    }
    
    deinit {
        if self.playerLayer != nil{
            self.pause()
            self.playerLayer?.volumn = 0.0
            self.dismissPlayer()
        }
        self.playerLayer?.removeExistingPlayer()
        self.playerLayer = nil
        self.allComletionReset()
    }
    func allComletionReset(){
        self.readyForDisplay = nil
        self.isFailToLoading = nil
        self.isDidStartVideo = nil
        self.isDidEndVideo = nil
        self.aTotalVideoDuration = nil
        self.aCurrentVideoTime = nil
        self.aCurrentVideoTimeVLC = nil
        self.aShowLoader = nil
     
    }
}
extension MJPlayer{
    func setupAVPlayer() {
        if self.subviews.isEmpty{
            self.playerLayer = LLVideoPlayer()
            self.playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
//            self.playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            self.addSubview(self.playerLayer!.view)
            self.playerLayer!.view.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraints([
                NSLayoutConstraint(item: self.playerLayer!.view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.playerLayer!.view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.playerLayer!.view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.playerLayer!.view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
            ])
            self.playerLayer?.cacheSupportEnabled = true
            self.playerLayer?.isReplay = self.isReplay
            let policy = LLVideoPlayerCachePolicy.default()
            if let policy = policy {
                self.playerLayer?.cachePolicy = policy
            }
            self.playerLayer?.delegate = self
           // try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, options: [])
        }
        //self.playerLayer?.view.frame = self.bounds
        
    }
    func loadVideo(aUrlStr:String) {
        guard let aVideoUrl = URL(string: aUrlStr) else {return}
        self.playerLayer?.loadVideo(withStreamURL: aVideoUrl)
        DispatchQueue.main.async {
            self.aShowLoader?(true)
        }
    }
    func pause(){
        self.isPlayerShouldPlay = false
        self.playerLayer?.delegate = self
        self.playerLayer?.pauseContent()
        
    }
    func isDownloaded(aUrlStr:String) ->Bool{
        guard let aVideoUrl = URL(string: aUrlStr) else {return false}
        return LLVideoPlayer.isCacheComplete(aVideoUrl)
    }
    func play(){
        self.isPlayerShouldPlay = true
        self.playerLayer?.playContent()
        
    }
    func reloadPlayer(){
        self.isPlayerShouldPlay = true
        self.playerLayer?.reloadCurrentVideoTrack()
    }
    func dismissPlayer(){
       // self.aShowLoader?(false)
        self.isPlayerShouldPlay = false
        if  self.playerLayer != nil{
            if  self.playerLayer?.avPlayerItem != nil{
                self.playerLayer?.avPlayerItem.asset.cancelLoading()
                self.playerLayer?.avPlayerItem = nil
            }
            if  self.playerLayer?.avPlayer != nil{
                self.playerLayer?.avPlayer = nil
            }
        }
        self.playerLayer?.dismissContent()
//        if  !self.playerLayer?.view.constraints.isEmpty{
//            self.playerLayer?.view.removeAllConstraints()
//        }
        self.playerLayer?.view.removeFromSuperview()
        self.playerLayer?.delegate = nil
        self.playerLayer = nil;
        self.playerLayer?.removeExistingPlayer()
        self.allComletionReset()

    }
    func setvolumn(){
        if ((self.playerLayer?.avPlayer) != nil) {
            self.playerLayer?.avPlayer.volume = self.volume
        }
    }
    
    func setSliderValues(_ currrentDuration :Double){
        self.playerLayer?.seekToTime(inSecond: Float(currrentDuration), userAction: false, completionHandler: { (isSeek) in
            self.play()
        })
    }
}

extension MJPlayer: LLVideoPlayerDelegate{
    func shouldVideoPlayerStartVideo(_ videoPlayer: LLVideoPlayer!) -> Bool {
        return true
    }
    func videoPlayerWillContinuePlaying(_ videoPlayer: LLVideoPlayer!) {
        print("videoPlayerWillContinuePlaying  ---  ---------------------- LLVideoPlayer")
    }
    func videoPlayerDidPlay(toEnd videoPlayer: LLVideoPlayer!) {
        self.isDidEndVideo?()
    }
    func videoPlayerWillStartVideo(_ videoPlayer: LLVideoPlayer!) {
        self.readyForDisplay?()
        DispatchQueue.main.async {

            self.aShowLoader?(false)}
        print("videoPlayerWillStartVideo---  ---------------------- LLVideoPlayer ")

       // if self.isLandScapVideo(videoPlayer1: videoPlayer) {
            videoPlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
//        }else{
//            videoPlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
//        }
        print("videoPlayerWillStartVideo")
    }
    func videoPlayerDidStartVideo(_ videoPlayer: LLVideoPlayer!) {
        if !self.isPlayerShouldPlay{
            self.pause()
        }
        DispatchQueue.main.async {
            self.aShowLoader?(false)
            
        }
         print("videoPlayerDidStartVideo ---  ---------------------- LLVideoPlayer")
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, readyForDisplay: Bool) {
        print("readyForDisplay \(readyForDisplay)---  ---------------------- LLVideoPlayer")
        self.readyForDisplay?()
        DispatchQueue.main.async {
            self.aShowLoader?(false)}
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, playbackBufferEmpty bufferEmpty: Bool) {
        DispatchQueue.main.async {

            self.aShowLoader?(false)}

         print("playbackBufferEmpty \(bufferEmpty)---  ---------------------- LLVideoPlayer")
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, playbackLikelyToKeepUp likelyToKeepUp: Bool) {
        DispatchQueue.main.async {

            self.aShowLoader?(true)}
         print("playbackLikelyToKeepUp \(likelyToKeepUp) ---  ---------------------- LLVideoPlayer")
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, durationDidLoad duration: NSNumber!) {
        print("duration - \(duration)")
        if self.isDurationVideoValid(aTimeInterval:TimeInterval(duration)){
            self.aTotalVideoDuration?(duration)
        }
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, didPlayFrame time: TimeInterval) {
        if self.isDurationVideoValid(aTimeInterval: time){
            self.aCurrentVideoTime?(time)
        }
    }
    func videoPlayer(_ videoPlayer: LLVideoPlayer!, didChangeStateFrom state: LLVideoPlayerState) {
        switch (state) {
        case LLVideoPlayerState.error:
            print("---\(Date()) LLVideoPlayerState:error --------- LLVideoPlayer")
            DispatchQueue.main.async {

                self.aShowLoader?(false)}
            break
        case LLVideoPlayerState.contentPaused:
              print("---\(Date()) LLVideoPlayerState:contentPaused ---------  LLVideoPlayer")
               //loader is Hide
            DispatchQueue.main.async {

                self.aShowLoader?(false)}
            break
        case LLVideoPlayerState.contentLoading:
              print("---\(Date()) LLVideoPlayerState:contentLoading --------- LLVideoPlayer")
          //  self.aShowLoader?(true)
            break
        case LLVideoPlayerState.contentPlaying:
             //loader is Hide
            print("--- \(Date()) LLVideoPlayerState:contentPlaying ---------  LLVideoPlayer")
            break
        case LLVideoPlayerState.dismissed:
             //loader is Hide
            print("---\(Date())  LLVideoPlayerState:dismissed ---------  LLVideoPlayer")
            DispatchQueue.main.async {
                self.aShowLoader?(false)}
            break
        case LLVideoPlayerState.unknown:
             //loader is show
            print("--- \(Date()) LLVideoPlayerState:unknown ---------  LLVideoPlayer")
//            self.aShowLoader?(true)
            break
        default:
            break
        }
    }
}
extension MJPlayer{
    func isLandScapVideo(videoPlayer1: LLVideoPlayer) -> Bool{
        if let resolution = resolutionForLocalVideo(videoPlayer1: videoPlayer1){//videoPlayer1.avPlayerItem.presentationSize as? CGSize{
            guard let width = resolution.width as? CGFloat, let height = resolution.height as? CGFloat else {
                return false
            }
            if abs(width) >= (abs(height) - 20){
                //landscap
                return true
            }else{
                //potrait
                return false
            }
        }
         return false
    }
    func resolutionForLocalVideo(videoPlayer1: LLVideoPlayer) -> CGSize? {
        guard let track = videoPlayer1.avPlayerItem.asset.tracks(withMediaType: AVMediaType.video).first else { return nil }
        let size = track.naturalSize.applying(track.preferredTransform)
        return CGSize(width: abs(size.width), height: abs(size.height))
    }

    func isDurationVideoValid(aTimeInterval:TimeInterval) -> Bool{
        guard !(aTimeInterval.isNaN || aTimeInterval.isInfinite) else {
            return false
        }
        return true
    }
}
extension UIImageView {
    func setContentLandscap() -> Bool{
        if let resolution = self.image?.size{//videoPlayer1.avPlayerItem.presentationSize as? CGSize{
            guard let width = resolution.width as? CGFloat, let height = resolution.height as? CGFloat else {
                return false
            }
             if abs(width) >= (abs(height) - 20){
                //landscap
                 return true
            }else{
                //potrait
                 return false
            }
        }
          return false
    }
}
