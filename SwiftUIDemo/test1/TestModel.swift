//
//  TestModel.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/13.
//  数据

import SwiftUI

struct TestModel : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var location : String
    
    var thumbnailName : String {return name}
}

let testArr = [
    TestModel(name: "长城", imageName: "photo",location: "北京"),
    TestModel(name: "外滩", imageName: "photo",location: "上海"),
    TestModel(name: "西湖", imageName: "photo",location: "杭州"),
    TestModel(name: "三清山", imageName: "photo",location: "上饶"),
]
