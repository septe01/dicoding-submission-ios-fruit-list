//
//  DetailFruitView.swift
//  Fruit List
//
//  Created by septe habudin on 13/06/22.
//

import SwiftUI

struct DetailFruitView: View {
    var data = [DataType]()
    
    var body: some View {
        //        let _ = print("data \(data)")
        
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: data[0].image!)) { image in
                    image.resizable()
                } placeholder: {
                    Color("BgColor")
                        .aspectRatio(.none, contentMode: .fit)
                        .frame(maxWidth: .infinity,maxHeight: 600)
                }
                .frame(maxWidth: .infinity,maxHeight: 400)
                VStack(spacing:10){
                    
                    
                    HStack {
                        ZStack{
                            Text(data[0].title ?? "")
                                .font(.title3)
                            GeometryReader { geometry in
                                Text(date())
                                    .font(.subheadline)
                                    .padding(.horizontal, 4.0)
                                    .background(Color("BgColor"))
                                    .cornerRadius(4)
                                    .offset(x:geometry.size.width - 95,y: 10)
                            }
                            
                        }
                    }
                    
                    
                    
                    Text(data[0].content!.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\t", with: "\t"))
                        .font(.body)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.083, brightness: 0.17, opacity: 0.767))
                        .multilineTextAlignment(.leading)
                }
                .padding()
                Spacer()
            }
        }
    }
    
    func date () -> String {
        let dateFormatter = DateFormatter()
        // formate date from string
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = dateFormatter.date(from: data[0].createdAt!)
        //new format date to string
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        return dateFormatter.string(from: date!)
    }
    
}

struct DetailFruitView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFruitView()
    }
}
