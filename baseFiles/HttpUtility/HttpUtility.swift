//
//  HttpUtility.swift
//  TokenHandleDemo
//
//  Created by CodeCat15 on 8/2/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Toaster
// makes http calls

struct HttpUtility
{
    private init() {}
    static let shared: HttpUtility = HttpUtility()
    
    
    func getApiDataJson(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        print(requestUrl)
        print(param)

        let param = param
        AF.request(requestUrl,method: .get, parameters: param).responseJSON{ (response) in
               
                if response.response?.statusCode == 200{
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                           
                            return
                        }
                        print(result)
                        let json = JSON(result)
                        print(json)
                 //       Toast(text: json.dictionaryValue["message"]?.stringValue).show()
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                    }
                }else{
                    
                }
            }
        
    }
    
    func getApiDataJsonWithHeader(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        let header = getDefaultHeaders()
        print(requestUrl)
        print(param)
        print(header)

        let param = param
        AF.request(requestUrl,method: .get, parameters: param,headers: header).responseJSON{ (response) in
               
                if response.response?.statusCode == 200{
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                            return
                        }
                        print(result)
                        let json = JSON(result)
                        print(json)
                 //       Toast(text: json.dictionaryValue["message"]?.stringValue).show()
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                    }
                }else{
                    
                }
            }
        
    }
    
    func getApiDataJsonWithHeaderVideo(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        let header = getDefaultHeaders()
        print(requestUrl)
        print(param)
        print(header)
        AF.request(requestUrl,method: .get, parameters: param,headers: header).responseJSON{ (response) in
               
              //  if response.response?.statusCode == 200{
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                            return
                        }
                        print(result)
                        let json = JSON(result)
                        print(json)
                 //       Toast(text: json.dictionaryValue["message"]?.stringValue).show()
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                    }
                }
         //   }
        
    }
    
    func getApiDataJsonWithHeaderMineVideo(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        let header = getDefaultHeaders()
        print(requestUrl)
        print(param)
        print(header)

        let param = param
        AF.request(requestUrl,method: .get, parameters: param,encoding: JSONEncoding.default,headers: header).responseJSON{ (response) in
               
                if response.response?.statusCode == 200{
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                           
                            return
                        }
                        print(result)
                        let json = JSON(result)
                        print(json)
                 //       Toast(text: json.dictionaryValue["message"]?.stringValue).show()
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                    }
                }else{
                    
                }
            }
        
    }
    
    func postApiDataJson(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        print(requestUrl)
        print(param)

        let param = param
        AF.request(requestUrl,method: .post, parameters: param).responseJSON{ (response) in
               
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                            return
                        }
                        let json = JSON(result)
                        print(json)
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                        Toast(text: "otp is not correct.").show()
                    }
                }else{
                    let json = JSON(response.result)
                    completionHandler(json)
                }
            }
    }

    
    func postApiDataJsonLoader(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        print(requestUrl)
        print(param)
      showHud()
        let param = param
        AF.request(requestUrl,method: .post, parameters: param).responseJSON{ (response) in
               hideHud()
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    switch response.result {
                    case .success:
                        guard let result = response.value else {
                            print(response.error.debugDescription)
                            return
                        }
                        let json = JSON(result)
                        print(json)
                        completionHandler(json)
                    case .failure(let error):
                        print(error)
                        //Toast(text: "otp is not correct.").show()
                    }
                }else{
                    let json = JSON(response.result)
                    completionHandler(json)
                }
            }
    }

    // WithHeader
    
    func postApiDataJsonWithHeader(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
            print("parameters - \(param)")
            
        AF.request(requestUrl, method: .post, parameters: param,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
            hideHud()
            switch response.result{
            case .success:
                guard let result = response.value else {
                    print(response.error.debugDescription)
                    showAlertError(message: response.error.debugDescription)
                    return
                }
                if response.response?.statusCode == 200 || response.response?.statusCode == 201{
                    let json = JSON(result)
                    print(json)
                    
                    completionHandler(json)
                }else{
                    let json = JSON(response.value!)
                    print(json)
                //    Toast(text: json.dictionaryValue["message"]?.stringValue).show()
                    if json.dictionaryValue.values.count > 0
                    {
                        if let arr = json.dictionaryValue.values.first?.arrayValue ,arr.count > 0
                        {
//                            print(json.dictionaryValue.values.first?.arrayValue[0].stringValue ?? "")
//                            showAlertError(message:json.dictionaryValue.values.first?.arrayValue[0].stringValue ?? "")
                        }
                    }
//                        let json = JSON(result)
//                        print(json)
//                        if let msg = json.dictionaryValue["message"]?.stringValue
//                        {
//                            showAlert(message: msg)
//                        }
                }
            case .failure(let error):
                print(error)
              //  showAlertError(message: error
                    //        .localizedDescription)
            }
        }
          
    }
    
//    func putApiDataJsonWithHeader(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
//    {
//
//        let headers = getDefaultHeaders()
//            print("headers -> \(headers)")
//            print(requestUrl)
//            print("parameters - \(param)")
//
//        AF.request(requestUrl, method: .put, parameters: param,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
//            hideHud()
//            switch response.result{
//            case .success:
//                guard let result = response.value else {
//                    print(response.error.debugDescription)
//                    showAlertError(message: response.error.debugDescription)
//                    return
//                }
//                if response.response?.statusCode == 200 || response.response?.statusCode == 201{
//                    let json = JSON(result)
//                    print(json)
//
//                    completionHandler(json)
//                }else{
//                    let json = JSON(response.value!)
//                    print(json)
//                //    Toast(text: json.dictionaryValue["message"]?.stringValue).show()
//                    if json.dictionaryValue.values.count > 0
//                    {
//                        if let arr = json.dictionaryValue.values.first?.arrayValue ,arr.count > 0
//                        {
////                            print(json.dictionaryValue.values.first?.arrayValue[0].stringValue ?? "")
////                            showAlertError(message:json.dictionaryValue.values.first?.arrayValue[0].stringValue ?? "")
//                        }
//                    }
////                        let json = JSON(result)
////                        print(json)
////                        if let msg = json.dictionaryValue["message"]?.stringValue
////                        {
////                            showAlert(message: msg)
////                        }
//                }
//            case .failure(let error):
//                print(error)
//              //  showAlertError(message: error
//                    //        .localizedDescription)
//            }
//        }
//
//    }
    
    
    func putApiDataJsonWithHeader(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
            print("parameters - \(param)")

        AF.request(requestUrl, method: .put, parameters: param,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
            hideHud()
            if response.response?.statusCode == 200 {
                print("status code 200")
                completionHandler(nil)
            }else{
                //completionHandler(nil)
                Toast(text: "\(String(describing: response.response?.statusCode))").show()
            }
        }
    }
    
    
    //edit profile
    
    func postFeedbackApiDataJsonWithHeaderOnlyStatuscode(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
            print("parameters - \(param)")
            
        AF.request(requestUrl, method: .post, parameters: param,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
            hideHud()
            if response.response?.statusCode == 200  {
                print("status code 200")
                    completionHandler(nil)
            }else{
                completionHandler(nil)
            
            }
        }
          
    }
    
    func postApiDataJsonWithHeaderStatusCode(requestUrl: String, completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
           
            
        AF.request(requestUrl, method: .post,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
            hideHud()
            if response.response?.statusCode == 200  {
                print("status code 200")
                    completionHandler(nil)
            }else{
                completionHandler(nil)
            
            }
        }
    }
    
    func postApiDataWithHeaderStatusCodeWithoutParam(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
           
            
        AF.request(requestUrl, method: .post,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
            hideHud()
            if response.response?.statusCode == 200  {
                print("status code 200")
                    completionHandler(nil)
            }else{
               // completionHandler(nil)
            
            }
        }
    }
    
    func postApiDataWithHeaderStatusCode1(requestUrl: String, param: [String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
           
            
        AF.request(requestUrl, method: .post,parameters:param,headers: headers).responseJSON{ (response) in
            hideHud()
            if response.response?.statusCode == 200  {
                print("status code 200")
                    completionHandler(nil)
            }else{
               // completionHandler(nil)
            
            }
        }
    }
    
    func postApiWithImageDataJson(requestUrl: String, param: [String:Any],images:[ImageData], completionHandler:@escaping(_ result: JSON)-> Void)
    {
        
        
        AF.upload(multipartFormData: { multiPart in
            for p in param {
                multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
            }
            for image in images
            {
                multiPart.append(image.data, withName: image.name, fileName: "\(image.name).jpg", mimeType: "image/jpg")
            }
        }, to: requestUrl, method: .post) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")
        }).responseJSON { (response) in
            switch response.result {
            case .success(let resut):
                print("upload success result: \(resut)")
                guard let result = response.value else {
                    print(response.error.debugDescription)
                 //   showAlert(message: response.error.debugDescription)
                    return
                }
                print(result)
                let json = JSON(result)
                print(json)
                completionHandler(json)
            case .failure(let error):
                print(error)
//                showAlert(message: error
//                            .localizedDescription)
            }
        }
    }
    
    func postVideoOnly(requestUrl: String, param: [String:Any],images:[ImageData],videoName:String,videoUrl:URL, completionHandler:@escaping(_ result: JSON)-> Void)
    {
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
        
        AF.upload(multipartFormData: { multiPart in
            for p in param {
                multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
            }
            for image in images
            {
                if image.name == "video"
                {
                //    multiPart.append(videoUrl, withName: "video", fileName:"filePath", mimeType: "video/mp4")
                 //   multiPart.append(videoUrl, withName: "video", fileName: "video.mp4", mimeType: "video/mp4")
                    
                    
                   // multiPart.append(("VIDEO".data(using: String.Encoding.utf8, allowLossyConversion: false))!, withName: "Type")

                    
                    multiPart.append(image.data, withName: "video", fileName: "video.mp4", mimeType: "video/mp4")
                   // multiPart.append(videoUrl, withName: image.name,mimeType: "file")
                 //   multiPart.append(image.data,withName:image.name,fileName: "\(image.name)file.mp4",mimeType: "video/mp4")
                }else if image.name == "preview"
                {
                    multiPart.append(image.data, withName: "preview",fileName: "preview.gif")
                }else{
                    multiPart.append(image.data, withName: "screenshot", fileName: "screenshot.png", mimeType: "image/png")
                }
                
            }
        }, to: requestUrl, method: .post,headers: headers) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")
       
            do{
              let j = try data.result.get()
                let jsonData = JSON(j)
                
                if data.response?.statusCode == 200  {
                        print("status code 200")
                        completionHandler(jsonData)
                    
                }else{
                    
                     completionHandler(jsonData)
                   // showAlertError(message:"\(data.response?.statusCode ?? 0)")
                
                }
                
            }catch{
                
            }
            
            
            
            //let jsonData = JSON(data.result.get())

           
        })
    }
    
    func postDocument(requestUrl: String,images:[ImageData],url:URL,completionHandler:@escaping(_ result: JSON)-> Void)
    {
        let headers = getDefaultHeaders()
            print("headers -> \(headers)")
            print(requestUrl)
        
        AF.upload(multipartFormData: { multiPart in
           
            for image in images
            {
                if url.absoluteString.hasSuffix("jpg"){
                    multiPart.append(image.data, withName: image.name, mimeType: "image/jpeg")
                }else if url.absoluteString.hasSuffix("png"){
                    multiPart.append(image.data, withName: image.name, mimeType: "image/png")
                }else if url.absoluteString.hasSuffix("pdf"){
               //     multiPart.append(image.data, withName: image.name, mimeType: "application/pdf")
                    multiPart.append(image.data, withName:image.name, fileName: "pdf", mimeType:"application/pdf")
                }else if url.absoluteString.hasSuffix("jpeg"){
                    multiPart.append(image.data, withName: image.name, mimeType: "image/jpeg")
                }
                
                   // multiPart.append(image.data, withName: "document", fileName: "screenshot.png", mimeType: "image/png")
//                multiPart.append(image.data, withName:image.name, fileName: "pdf", mimeType:"application/pdf")
//                multiPart.append(url, withName: "photo")
            }
        }, to: requestUrl, method: .post,headers: headers) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")
        }).responseJSON { (response) in
            switch response.result {
            case .success(let resut):
                print("upload success result: \(resut)")
                guard let result = response.value else {
                    print(response.error.debugDescription)
                 //   showAlert(message: response.error.debugDescription)
                    return
                }
               
                let json = JSON(result)
                print(json)
                completionHandler(json)
            case .failure(let error):
                print(error)
//                showAlert(message: error
//                            .localizedDescription)
            }
        }
    }
    
    func postApiForEditProfileHeaderWithImageDataJson(requestUrl: String, param: [String:Any],images:[ImageData], completionHandler:@escaping(_ result: JSON)-> Void)
      {
          let headers = getDefaultHeaders()
              print("headers -> \(headers)")
              print(requestUrl)
              print(param)
              print(images)
          //AF.request(requestUrl, method: .post, parameters: param,encoding:JSONEncoding.default,headers: headers).responseJSON{ (response) in
          AF.upload(multipartFormData: { multiPart in
              for p in param {
                  multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
              }
              for image in images
              {
                  
                      multiPart.append(image.data, withName: "photo", fileName: "photo.png", mimeType: "image/png")
                  
              }
          }, to: requestUrl, method: .post,headers: headers) .uploadProgress(queue: .main, closure: { progress in
              print("Upload Progress: \(progress.fractionCompleted)")
          }).responseJSON(completionHandler: { data in
              print("upload finished: \(data)")
              let jsonData = JSON(data)
              if data.response?.statusCode == 200  {
                      print("status code 200")
                     
                      completionHandler(jsonData)
              }else{
                  
                   completionHandler(jsonData)
                   Toast(text: "\(data.response?.statusCode ?? 0)").show()
                 // showAlertError(message:"\(data.response?.statusCode ?? 0)")
              
              }
              
              
              
          })//.responseJSON { (response) in
//              switch response.result {
//              case .success(let resut):
//                  print("upload success result: \(resut)")
//                  guard let result = response.value else {
//                      print(response.error.debugDescription)
//                   //   showAlert(message: response.error.debugDescription)
//                      return
//                  }
//
//                  let json = JSON(result)
//                  print(json)
//                  completionHandler(json)
//              case .failure(let error):
//                  print(error)
//  //                showAlert(message: error
//  //                            .localizedDescription)
//              }
 //         }
      }
      
      
          
        
    
    func deleteApiDataJson(requestUrl: String,param:[String:Any], completionHandler:@escaping(_ result: JSON?)-> Void)
    {
        print(requestUrl)
        print(param)

        let header = getDefaultHeaders()
        let param = param
        AF.request(requestUrl,method: .delete, parameters: param,headers: header).responseJSON{ (response) in
               
                if response.response?.statusCode == 200  {
                    
                        print("status code 200")
                       
                        completionHandler(nil)
                    
                }else{
                    completionHandler(nil)
                
                }
            
    }
    
    }
    private func decodeJSONResponse<T:Decodable>(responseData:Data, resultType: T.Type) -> T?
    {
        let result = try? JSONDecoder().decode(T.self, from: responseData)
        return result
    }
    
    func getDefaultHeaders() -> HTTPHeaders{
        
        let headers: HTTPHeaders = [
            "Accept":"application/json",
            "Authorization": "Bearer \(ApplicationPreference.getUserToken() ?? "")"
        ]
        return headers
    }
    
//    func getDefaultHeadersUpload() -> HTTPHeaders{
//
//        let headers: HTTPHeaders = [
//            "Accept": "application/json",
//            "Content-Type":"multipart/form-data",
//            "Authorization": "Bearer 32638|XcNFKL7qq3TOjRUIzvClnRHP9iL5BN75Qr5G9QkU"
//        ]
//        return headers
//    }
}

//?=
struct Response<T: Decodable>: Decodable {
    var success:Bool?
    var data:T?
    var message: String?
}

struct ImageData {
    var name:String
    var data:Data
}
