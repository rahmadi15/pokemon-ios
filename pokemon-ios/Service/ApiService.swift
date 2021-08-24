//
//  ApiService.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 22/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService: NSObject {
    static let instance = ApiService()
    
    public func getListPokemon<T: Codable>(onSuccess: @escaping (T) -> Void, onError: @escaping (String) -> Void, onFailed: @escaping (String) -> Void){
        
        let url = "https://pokeapi.co/api/v2/pokemon/"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).response { response in
            let statusCode = response.response?.statusCode ?? 0
            self.checkStatusCode(response: statusCode) { resultSuccess in
                if resultSuccess {
                    switch response.result {
                    case .success(_):
                        do{
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(T.self, from: response.data!)
                            onSuccess(result)
                        } catch let error {
                            onFailed(error.localizedDescription)
                        }
                    case .failure(let failure) :
                        onFailed(failure.localizedDescription)
                    }
                }
            }
        }
    }
    
    public func getDetailPokemon<T: Codable>(url: String,onSuccess: @escaping (T) -> Void, onError: @escaping (String) -> Void, onFailed: @escaping (String) -> Void){
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).response { response in
            let statusCode = response.response?.statusCode ?? 0
            self.checkStatusCode(response: statusCode) { resultSuccess in
                if resultSuccess {
                    switch response.result {
                    case .success(_):
                        do{
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(T.self, from: response.data!)
                            onSuccess(result)
                        } catch let error {
                            onFailed(error.localizedDescription)
                        }
                    case .failure(let failure) :
                        onFailed(failure.localizedDescription)
                    }
                }
            }
        }
    }
    
    func checkStatusCode(response: Int, success: @escaping(Bool) -> Void ) {
        if response == 403 {
            self.cancelAllRequest()
            success(false)
        } else if response == 401 {
            self.cancelAllRequest()
            success(false)
        } else {
            success(true)
        }
    }
    
    public func cancelAllRequest() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler({ dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        })
    }
    func pauseRequest() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler({ dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.suspend() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        })
    }
    
    func resumeRequest() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler({ dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.resume() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        })
    }
}
