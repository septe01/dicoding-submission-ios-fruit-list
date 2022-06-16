//
//  ContentView.swift
//  Fruit List
//
//  Created by septe habudin on 12/06/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView(){
            ZStack{
                ListFruitView()
                
                    .alert(isPresented: $obs.isError) {
                        Alert(
                            title: Text("Error"),
                            message: Text("\(obs.message)"),
                            dismissButton: .default(Text("ok"), action: {
                                 obs.loadStats()
                            }))
                    }
                
                if obs.isLoading{
                    LoadingView()
                }
                
            }
            .refreshable {
                 obs.loadStats()
            }
            
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    NavigationLink(destination: Profile(), label: {
                        Image(systemName: "person.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                    })
                    // MARK: disable link when load
                        .disabled(obs.isLoading)
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Fruit List")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
