//
//  HttpUtility.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import Foundation

struct HttpUtility{
    
    // GET Api call
    func getApiData<T:Decodable>(requestUrl: URL, requestType: T.Type,completionHandler: @escaping(_ result:T?) -> Void ) {
        
        
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            guard let responseData = responseData else {
                return
            }
            if (error == nil && responseData.count != 0)
            {
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(T.self, from: responseData)
                    
                    // return result with complietion Handler
                    completionHandler(result)
                } catch let error {
                    
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
        
    // POST Api Call
    func postApiData<T:Decodable>(requestUrl: URL,httpBody:Data,requestType:T.Type, completionHandler: @escaping (_ result:T) -> Void){
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = httpBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (response, httpResponse, error) in
            guard let responsedata = response else {
                return
            }
            if error == nil && responsedata.count != 0 {
                do {
                    let apiData = try JSONDecoder().decode(T.self, from: responsedata)
                    completionHandler(apiData)
                } catch let error {
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
            
        }.resume()
}
}
