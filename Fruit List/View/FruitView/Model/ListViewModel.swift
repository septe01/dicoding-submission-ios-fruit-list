//
//  ListViewModel.swift
//  Fruit List
//
//  Created by septe habudin on 12/06/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class Observer: ObservableObject{
    @Published var Datas = [DataType]()
    @Published var isLoading = false
    @Published var isError = false
    @Published var message = ""
    
    init() {
        getList(for: "getlist")
    }
    
    
    func getList (for op: String) {
        
        
        if op != "getlist"{
            self.Datas = []
            self.isLoading = false
        }else{
            self.isLoading = true
        }
        
        AF.request("https://fruits-table.herokuapp.com/api/v1/blog", method: .get).responseData{ response in
            switch response.result {
            case .success:
                let json = try! JSON(data: response.data!)
                var y = 1
                for i in json {
                    for ( _ , k) in i.1 {
                        self.Datas.append(DataType(id: k["id"].intValue, title: k["title"].stringValue, image: k["image"].stringValue, content: k["content"].stringValue, createBy: k["create_by"].intValue, categoryId: k["category_id"].intValue, createdAt: k["createdAt"].stringValue, updatedAt: k["updatedAt"].stringValue))
                        
                    y = y+1
                    }
                }
                self.isLoading = false
                self.isError = false
            case let .failure(error):
                self.isLoading = false
                self.isError = true
                if error.isSessionTaskError{
                    self.message = "The Internet connection appears to be offline."
                }else{
                    self.message = "\(error.localizedDescription)"
                }
            }
        }
        
    }
    
    
    
    func loadStats() {
        getList(for: "loadData")
    }
    
}
