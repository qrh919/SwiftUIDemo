//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/17.
//

import SwiftUI

struct LandmarkList: View {
    //绑定属性 值改变的会刷新UI
    @State private var showFavorites = false
    //绑定全局对象 值改变会刷新UI
    @EnvironmentObject var userData : UserData
    
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavorites, label: {
                    Text("只展示收藏")
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                })
                ForEach(userData.userLandmarks){ landmark in
                    if !self.showFavorites || landmark.isFavorite{
                        NavigationLink(
                            destination:
                                LandmarkDetail(landmark: landmark).environmentObject(self.userData)){
                            LandmarkCell(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("中国地标"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(UserData())
//        ForEach(["iPhone 8","iPhone XS"],id:\.self){
//            deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
