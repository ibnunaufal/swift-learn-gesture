//
//  CapsuleGroup.swift
//  Testing
//
//  Created by Macbook Pro on 17/01/2023.
//

import SwiftUI

struct CircleGroup: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        Circle().stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40).frame(width: 260, height: 260, alignment: .center)
        Circle().stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80).frame(width: 260, height: 260, alignment: .center)
    }
}

struct CircleGroup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            CircleGroup(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
