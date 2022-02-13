//
//  ProfileView.swift
//  Profiler
//
//  Created by mac on 03/02/22.
//

import SwiftUI


struct ProfileView: View {

    @State var isShowPicker: Bool = false
    @State var image = UIImage();

    var body: some View {
        NavigationView {
            HStack{
                Button(action: {
                    self.isShowPicker = true
                }) {
                    ZStack(alignment: .bottomTrailing) {
                        if self.image.pngData() != nil {
                            Image(uiImage: self.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(150.0)
                        } else {
                            Image(systemName: "person")
                                .circleImageModifier()
                                .frame(width: 100, height: 100)
                        }
                        Image(systemName: "plus")
                            .circleImageModifier()
                            .frame(width: 30, height: 30)
                    }
                    
                }
            }
            .padding([.horizontal])
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(sourceType: .photoLibrary, image: self.$image)
            }
            .navigationBarTitle("Profile")
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
