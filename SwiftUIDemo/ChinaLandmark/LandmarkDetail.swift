//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/16.
//

import SwiftUI

struct LandmarkDetail: View {
    
    let landmark : Landmark
    //绑定全局对象 值改变会刷新UI
    @EnvironmentObject var userData : UserData
    //获取当前对象的位置
    var landmarkIndex : Int{
        userData.userLandmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            
            MapView(center: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:350)
            
            Image(systemName: "photo")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 250, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 10)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading, spacing :8){
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action: {
                        self.userData.userLandmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if userData.userLandmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }else{
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
//                        userData.userLandmarks[self.landmarkIndex].isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
                    }
                }
                
                HStack {
                    Text(landmark.city).font(.subheadline)
                    Spacer()
                    Text(landmark.province).font(.subheadline)
                }
            }.padding()
            
            Spacer()
        }.navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[2])
            .environmentObject(UserData())
    }
}
