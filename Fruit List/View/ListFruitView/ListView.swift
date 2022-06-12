//
//  ListView.swift
//  Fruit List
//
//  Created by septe habudin on 12/06/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var obs = Observer()
    
    var body: some View {
        List(obs.Datas){i in
            Cell(title:i.title!,image: "https://fruits-table.herokuapp.com/\(i.image!)")
        }
    }
}

struct Cell: View{
    
    var title = ""
    var image = ""
    
    var body: some View{
       
        HStack{
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            Text(title)
        }
         
    }
}
