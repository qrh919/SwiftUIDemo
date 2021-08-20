//
//  User.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/18.
//

import Foundation

struct User {
    var username : String
    var prefersNotifications = true
    var prefersSeason = Season.summer
    var birthday = Date()
    
    static let `default` = Self(username: "qrh")
    
    enum Season:String, CaseIterable {
        case spring = "🌺"
        case summer = "☀️"
        case autumn = "🍃"
        case winter = "⛄️"
    }
}
