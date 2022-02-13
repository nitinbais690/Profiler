//
//  ImageCircleExtention.swift
//  Profiler
//
//  Created by mac on 13/02/22.
//

import SwiftUI

extension Image {
    func circleImageModifier()-> some View {
        self
        .resizable()
        .scaledToFill()
        .padding(10)
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(150.0)
    }
    

}

