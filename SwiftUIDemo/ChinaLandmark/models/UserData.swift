//
//  UserData.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/17.
//

import SwiftUI
import Combine
//ObservableObject 实现观察者协议
final class UserData: ObservableObject {
    //第一种方式 @Published时默认修改landmark值就会调用objectWillChange.send()方法
    @Published var userLandmarks = landmarks
    
//    //第二种方式 手动发送状态更新
//    //1、固定写法 创建发布者
//    let objectWillChange = ObservableObjectPublisher()
//    //2、landmark数据发生改变时 发送通知
//    var userLandmarks = landmarks{
//        willSet{
//            objectWillChange.send()
//        }
//    }
}
