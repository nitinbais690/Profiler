//
//  ShopDetailsView.swift
//  Profiler
//
//  Created by mac on 03/02/22.
//

import SwiftUI

struct ShopDetailsView: View {
    var seletedImage: UIImage;
    
    var body: some View {
        ZStack {
            Image(uiImage: seletedImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            Text("good Product")
                .foregroundColor(Color.blue)
        
        }
        .background(Color.red)
    }
}
