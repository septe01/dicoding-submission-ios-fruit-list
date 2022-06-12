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
    
    init(){
        AF.request("https://fruits-table.herokuapp.com/api/v1/blog", method: .get).responseData{ response in
            switch response.result {
            case .success:
                let json = try! JSON(data: response.data!)
//                print("Validation Successful \(json)")
                for i in json {
                    for ( _ , k) in i.1 {
//                        print("i -> \(k)")
                        self.Datas.append(DataType(id: k["id"].intValue, title: k["title"].stringValue, image: k["image"].stringValue, content: k["content"].stringValue, createBy: k["create_by"].intValue, categoryId: k["category_id"].intValue, createdAt: k["createdAt"].stringValue, updatedAt: k["updatedAt"].stringValue))
                    }
                }
            case let .failure(error):
                print(error)
            }
    }
}
    
}
