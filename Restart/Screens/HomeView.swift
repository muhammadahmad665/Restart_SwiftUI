//
//  HomeView.swift
//  Restart
//
//  Created by Ahmed on 24/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Property
    
    @AppStorage("onbording") var isOnbordingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 20) {
            //        MARK: Header
            Spacer()
            ZStack {
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation
                                .easeOut(duration: 4)
                                .repeatForever()
                               , value: isAnimating)
                //
            }//: Zstack
            //        MARK: Center
            Text("Time that leades to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //        MARK: Footer
            Spacer()
            
            Button(action: {
                withAnimation {
                    // Active
                    playSound(sound: "success", type: "m4a")
                    isOnbordingViewActive = true
                    
                }
                
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: End Vstack
        .onAppear(perform: {
            // Thread
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
