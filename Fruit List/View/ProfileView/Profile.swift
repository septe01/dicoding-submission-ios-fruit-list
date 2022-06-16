//
//  Profile.swift
//  Fruit List
//
//  Created by septe habudin on 12/06/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ScrollView{
            VStack(spacing:14){
                Image("septe")
                    .cornerRadius(100)
                
                VStack(spacing:4){
                    Text("SepteHabudin")
                        .font(.title3)
                        .bold()
                    
                    Text("FullStack Developer")
                        .font(.subheadline)
                        .tracking(1)
                }
                
                HStack(spacing:50){
                    ButtonView(url:"https://github.com/septe01",image:"git")
                    ButtonView(url:"https://www.instagram.com/septestia",image:"instagram")
                    ButtonView(url:"https://www.linkedin.com/in/septe-habudin/",image:"linkedin")
                }
                .padding(.top,15)
                .padding(.bottom,15)
                
                Divider()
                
                Text("""
                \tI am a FullStack Developer, I can build applications with javascript programming. when I make a web application I can use reactJs from my skills section, and when I make a mobile application I can use react native, as well as build a service I can use nodejs.
                but currently I am a FrontEnd Developer at a technology company in Jakarta, my job is to build web applications with the javascript library, namely ReactJS.
                """)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 20.0)
                
                
            }
            .padding(.vertical, 30.0)
        }
        .padding()
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

struct ButtonView: View {
    var url = ""
    var image = ""
    var body: some View {
        Link(destination: URL(string: url)!) {
            Image(image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 20, height: 20)
        }
        .padding(.all,10)
        .background(Color("BgColor"))
        .cornerRadius(30)
    }
}
