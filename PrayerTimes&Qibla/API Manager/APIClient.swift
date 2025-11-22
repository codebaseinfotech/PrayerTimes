//
//  APIClient.swift
//  Alojeiri
//
//  Created by Ankit Gabani on 24/04/24.
//

import Foundation
import Alamofire
import SVProgressHUD
import UIKit


class APIClient: NSObject {
    
    typealias completion = ( _ result: Dictionary<String, Any>, _ error: Error?) -> ()
    
    class var sharedInstance: APIClient {
        
        struct Static {
            static let instance: APIClient = APIClient()
        }
        return Static.instance
    }
    
    var responseData: NSMutableData!
    
    func pushNetworkErrorVC()
    {
        
    }
    
    func MakeAPICallWithOutHeaderPost(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            

            AF.request(BASE_URL + url, method:.post, parameters: parameters,encoding: JSONEncoding.default) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    
    func MakeAPICallWithAuthHeaderPostAppUpdate(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        let Token = UserDefaults.standard.value(forKey: "Token") as? String
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded","Accept-Language":Language.shared.currentAppLang]
            
            AF.request(BASE_URL + url, method:.post, parameters: parameters,encoding: URLEncoding(destination: .httpBody), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    
    func MakeAPICallWithAuthHeaderPost(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        let Token = UserDefaults.standard.value(forKey: "Token") as? String
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let headers: HTTPHeaders = ["Content-Type": "application/json","Accept-Language":Language.shared.currentAppLang]
            
            AF.request(BASE_URL + url, method:.post, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")  
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    func MakeAPICallWithAuthHeaderPostLanguage(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            let Token = UserDefaults.standard.value(forKey: "Token") as? String
            
            let headers: HTTPHeaders = ["Content-Type": "application/json","Accept-Language":Language.shared.currentAppLang]
            
            AF.request(BASE_URL + url, method:.post, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    func MakeAPICallWithOutAuthHeaderGet(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let headers: HTTPHeaders = ["":""]
            
            AF.request(BASE_URL + url, method:.get, parameters: parameters,encoding: URLEncoding(destination: .queryString), headers: nil) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    func MakeAPICallWithAuthHeaderGet(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let Token = UserDefaults.standard.value(forKey: "Token") as? String
            
            let headers: HTTPHeaders = ["Content-Type": "application/json","Accept-Language":Language.shared.currentAppLang]
            
            print(headers)
            
            AF.request(BASE_URL + url, method:.get, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    
    func MakeAPICallWithAuthHeaderGetEnglish(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let Token = UserDefaults.standard.value(forKey: "Token") as? String
            
            let headers: HTTPHeaders = ["Content-Type": "application/json","Accept-Language":"en"]
            
            print(headers)
            
            AF.request(BASE_URL + url, method:.get, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    func MakeAPICallWithAuthHeaderGetArabic(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(BASE_URL + url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
            
            let Token = UserDefaults.standard.value(forKey: "Token") as? String
            
            let headers: HTTPHeaders = ["Content-Type": "application/json","Accept-Language":"ar"]
            
            print(headers)
            
            AF.request(BASE_URL + url, method:.get, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: headers) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    
    
    func MakeAPICallWithAuthHeaderGetClientAPI(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSDictionary?, Error?, Int?) -> Void) {
        
        print("url = \(url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
                                    
            AF.request(url, method:.get, parameters: parameters,encoding: URLEncoding(destination: .methodDependent), headers: nil) .responseJSON { (response) in
                
                switch(response.result) {
                    
                case .success:
                    if response.value != nil{
                        if let responseDict = ((response.value as AnyObject) as? NSDictionary) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
    
    func showIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
        
    }
    
    func showSuccessIndicator(message: String){
        SVProgressHUD.showSuccess(withStatus: message)
    }
}


