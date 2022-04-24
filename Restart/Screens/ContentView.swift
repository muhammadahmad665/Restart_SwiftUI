//
//  ContentView.swift
//  Restart
//
//  Created by Ahmed on 24/04/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: Property
    @AppStorage("onbording") var isOnbordingViewActive: Bool = true
    
    //MARK: Body
    
    var body: some View {
        ZStack{
            if isOnbordingViewActive{
                OnbordingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
