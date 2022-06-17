//
//  Service.swift
//  TokenHandleDemo
//
//  Created by CodeCat15 on 8/2/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct AppUrl {
    
    private struct Domains {
        static let Dev = "https://dev.rdxplays.com"
        static let Live = "https://prod.rdxplays.com"
        static let UAT = ""
        static let Local = ""
        static let QA = ""
    }
    private  struct Routes {
        static let Api = "/api/"
    }
    
    private  static let Domain = Domains.Live
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
   
    
    static var ImageUrl: String {
        return  "https://"
    }
    static var EmailLogin: String {
        return BaseURL  + "login/email/otp"
    }
    static var EmailVerify: String {
        return BaseURL  + "login/email"
    }
    static var MobileLogin: String {
        return BaseURL  + "login/phone/otp"
    }
    static var MobileVerify: String {
        return BaseURL  + "login/phone"
    }
    static var ComunityVertical: String {
        return BaseURL  + "clips/sections"
    }
    static var ComunityHorizontal: String {
        return BaseURL  + "clips"
    }
    
    static var influencersSuggest: String {
        return BaseURL  + "influencers/suggested-user-profile"
    }
    
    static var GetIntrest: String {
        return BaseURL  + "interest"
    }
    static var GetMyProfile: String {
        return BaseURL  + "profile"
    }
    static var Followers: String {
        return BaseURL  + "users/"
    }
    static var FacebookLogin: String {
        return BaseURL  + "login/facebook"
    }
    static var GoogleLogin: String {
        return BaseURL  + "login/google_ios"//"login/google"
    }
    
    static var AppleLogin: String {
        return BaseURL  + "login/apple"
    }
    
    static var ViewMoreVideos: String {
        return BaseURL  + "clips"
    }
    static var  Reports: String {
        return BaseURL  + "reports"
    }
    static var communitySection: String {
        return BaseURL + "clips/section-clips"
    }
    static func favourate(id:String) -> String{
        return BaseURL +  "clips/\(id)/saves"
    }
    static func like(id:String)->String {
        return BaseURL +  "clips/\(id)/likes"
    }
    static func Follow(id:String)->String {
        return BaseURL + "users/\(id)/followers" 
    }
    static func UserProfile(userId:String)->String {
        return BaseURL + "users/\(userId)"
    }
    
    static func GetAllFollowerList(userId:String)->String {
        return BaseURL + "users/\(userId)/followers"
    }
    static var uploadVideo: String {
        return BaseURL + "clips"
    }
    static var notifications: String {
        return BaseURL + "notifications"
    }
    static var UpdateProfile: String {
        return BaseURL + "profile"
    }
    
    static var DeletePhoto: String {
        return BaseURL + "profile/photo"
    }
    static var feedback: String {
        return BaseURL + "user-feedback"
    }
    static var verification: String {
        return BaseURL + "verifications"
    }
    
    static var disableAccount: String{
        return BaseURL + "disableProfile"
    }
    
    static var topBanner: String{
        return BaseURL + "top-banners"
    }
    static var searchUser: String{
        return BaseURL + "users"
    }
    static var searchHastage: String{
        return BaseURL + "hashtags"
    }
    static var tredingHashtag: String{
        return BaseURL + "trending-hashtags/clips"
    }
    
    static var HashtagTreding: String{
        return BaseURL + "hashtags-challenge/clips"
    }
    
    static var SuggestionForYou: String{
        return BaseURL + "influencers/top-influencers"
    }
    
    static func CommentList(id:String)->String {
        return BaseURL + "clips/\(id)/comments"
    }
    
    
    static func deleteCommentList(ClipId:String,MshId:String)->String {
        return BaseURL + "clips/\(ClipId)/comments/\(MshId)"
    }
    
    static var tredingHashtagVideo: String{
        return BaseURL + "trending-hashtags/videos"
    }
    
    static var articlesSections: String{
        return BaseURL + "articles/sections"
    }
    static var articles: String{
        return BaseURL + "articles"
    }
    static var shortlistedVideo: String{
        return BaseURL + "talent-hunt/selected-clips"
    }
    static var latestVideo: String{
        return BaseURL + "talent-hunt/all-clips"
    }
    static var SongsList: String{
        return BaseURL + "songs"
    }
    static var stickersSections: String{
        return BaseURL + "stickers/sections"
    }
    static var stickers: String{
        return BaseURL + "stickers"
    }
    static func chatList(id:String)->String {
        return BaseURL + "threads/\(id)/messages"
    }
    
    static func deleteMsg(threadId:String,msgId:String)->String {
        return BaseURL + "threads/\(threadId)/messages/\(msgId)"
    }
    
    static var conversation: String{
        return BaseURL + "threads"
    }
    
    static func blockedUser(userId:String)->String {
        return BaseURL + "users/\(userId)/blocked"
    }
    static func blockedClip(clipId:String)->String {
        return BaseURL + "clips/\(clipId)/blocked"
    }
    
    static func notification(id:String)->String {
        return BaseURL + "devices/\(id)"
    }
    
    static var notificationPost: String{
        return BaseURL + "devices"
    }
    
    static func editPutApi(id:String)->String {
        return BaseURL + "clips/\(id)"
    }
    
    static var deleteAPI: String{
        return BaseURL + "clips/"
    }
    
    static func BecomeStudio(userName:String)->String {
        return BaseURL + "/studios/\(userName)/register"
    }
}



