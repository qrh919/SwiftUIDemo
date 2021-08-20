//
//  Landmark.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/17.
//

import SwiftUI
import CoreLocation

struct Landmark : Identifiable {
    var id : Int
    var category : String
    var name : String
    var city : String
    var province : String
    
    var latitude : Double
    var longitude : Double
    var locationCoordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var imageName : String
    var isFavorite : Bool
    var isFeatured : Bool
    
}

let landmarks = [
    Landmark(id: 1, category: "古迹", name: "天安门", city: "北京", province: "北京市", latitude: 39.9087243, longitude: 116.3952859, imageName: "photo", isFavorite: true, isFeatured: true),
    Landmark(id: 2, category: "现代建筑", name: "东方明珠", city: "上海", province: "上海市", latitude: 31.2396935, longitude: 121.4975613, imageName: "photo", isFavorite: false, isFeatured: true),
    Landmark(id: 3, category: "自然景观", name: "西湖", city: "杭州", province: "浙江省", latitude: 30.2430439, longitude: 120.1258988, imageName: "photo", isFavorite: true, isFeatured: true)
    ,
    Landmark(id: 4, category: "古迹", name: "天安门", city: "北京", province: "北京市", latitude: 39.9087243, longitude: 116.3952859, imageName: "photo", isFavorite: true, isFeatured: true),
    Landmark(id: 5, category: "古迹", name: "天安门", city: "北京", province: "北京市", latitude: 39.9087243, longitude: 116.3952859, imageName: "photo", isFavorite: true, isFeatured: true),
    Landmark(id: 6, category: "古迹", name: "天安门", city: "北京", province: "北京市", latitude: 39.9087243, longitude: 116.3952859, imageName: "photo", isFavorite: true, isFeatured: true)
]

let featuredLandmarks = landmarks.filter{$0.isFeatured}

