//
//  ListFruitView.swift
//  Fruit List
//
//  Created by septe habudin on 13/06/22.
//

import SwiftUI

struct ListFruitView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        
        List(obs.Datas){i in
            ZStack {
                Cell(title:i.title!,image: i.image!,content: i.content!)
                NavigationLink(destination: DetailFruitView(data: [i])) {
                    
                }
                // MARK: handle arrow icon on list
                .buttonStyle(PlainButtonStyle())
                .frame(width:0)
                .opacity(0)
            }
            
        }
        .onAppear(perform: {
            //MARK: handle spase in top list
            UITableView.appearance().contentInset.top = -35
        })
    }
}


struct Cell: View{
    var title = ""
    var image = ""
    var content = ""
    
    var body: some View{
        
        HStack{
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                Color("BgColor")
            }
            .frame(width: 128, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10){
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                Text(content.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\t", with: "\t"))
                    .font(.subheadline)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.083, brightness: 0.17, opacity: 0.767))
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                
                
            }
        }
        
    }
}
