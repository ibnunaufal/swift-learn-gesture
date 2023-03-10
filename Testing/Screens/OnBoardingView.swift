//
//  OnBoardingView.swift
//  Testing
//
//  Created by Macbook Pro on 17/01/2023.
//

import Foundation
import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOfset: CGFloat = 0
    
    var body: some View{
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                Spacer()
                VStack(spacing: 0){
                    Text("Share").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving
                    """).font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal, 10)
                } // Header
                
                ZStack{
                    CircleGroup(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1").resizable().scaledToFit()
                } // Body
                
                Spacer()
                
                ZStack{
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    
                    HStack{
                        Capsule().fill(Color("ColorRed")).frame(width: buttonOfset + 80)
                        Spacer()
                    }
                    
                    Text("Get Started").font(.system(.title3, design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x: 0)
                    
                    HStack {
                        ZStack{
                            Capsule().fill(Color("ColorRed"))
                            Capsule().fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24, weight: .bold))
                        }.foregroundColor(.white).frame(width: 80, height: 80, alignment: .center)
                            .offset(x: buttonOfset)
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        if gesture.translation.width > 0 && buttonOfset <= buttonWidth - 80
                                        {
                                            buttonOfset = gesture.translation.width
                                        }
                                    }
                                    .onEnded{ _ in
                                        if buttonOfset > buttonWidth / 2{
                                            buttonOfset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOfset = 0
                                        }
                                    }
                            )
                        Spacer()
                    }
                } // Footer
                .frame(height: 80, alignment: .center).padding()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View{
        OnBoardingView()
    }
}
