//
//  ContentView.swift
//  Fruit List
//
//  Created by septe habudin on 12/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView(){
           ListView()
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

