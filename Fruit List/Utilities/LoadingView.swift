//
//  LoadingView.swift
//  Fruit List
//
//  Created by septe habudin on 14/06/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color("BgColor")
                .ignoresSafeArea()
                .opacity(0.9)
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
