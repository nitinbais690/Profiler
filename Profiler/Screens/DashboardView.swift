//
//  DashboardView.swift
//  Profiler
//
//  Created by mac on 31/01/22.
//

import SwiftUI

class ImagesData: ObservableObject {
    @Published var imagesName = [String]();
    init(){
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath, let items = try? fm.contentsOfDirectory(atPath: path){
            for item in items {
                if item.hasSuffix("jpeg") {
                    self.imagesName.append(item)
                }
            }
        }
    }
}

struct DashboardView: View {
    @StateObject  var imagesData: ImagesData = ImagesData();
    
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(0..<imagesData.imagesName.count){ i in
                    let img = UIImage(named: imagesData.imagesName[i])!;
                    NavigationLink(
                        destination: ShopDetailsView(seletedImage: img),
                        label: {
                            Image(uiImage: img)
                                .resizable()
                                .padding([.top], 5)
                                .padding([.horizontal], 10)
                                .frame(height: 150)
                                .cornerRadius(15.0)
                        })
                }
            }
            .padding([.top], 5)
            .navigationBarTitle("Dashboard")
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
       
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
