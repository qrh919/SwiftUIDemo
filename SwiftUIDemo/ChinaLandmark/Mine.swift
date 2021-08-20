//
//  Mine.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/18.
//

import SwiftUI

struct Mine: View {
    //编辑按钮绑定值
    @Environment(\.editMode) var mode
    //绑定2份数据 用于数据修改
    @State var user = User.default
    @State var userCopy = User.default
    
    var dataFormatter : DateFormatter{
        let df = DateFormatter()
        df.dateFormat = "yyyy年M月d日"
        return df
    }
    
    var body: some View {
        VStack (alignment:.trailing){

            HStack {
                if mode?.wrappedValue == .active{
                    Button(action: {
                        self.user = self.userCopy
                        //添加修改动画
                        self.mode?.animation().wrappedValue = .inactive
                    }, label: {
                        Text("完成")
                    })
                }
                Spacer()
                EditButton().padding()
            }
            //非编辑状态
            if mode?.wrappedValue == .inactive{
                List{
                    Text(user.username).font(.largeTitle).bold()
                    Text("允许通知：\(user.prefersNotifications ? "是":"否") ")
                    Text("喜欢的季节：\(user.prefersSeason.rawValue)")
        //            Text("生日：\(dataFormatter.string(from: user.birthday))")
                    Text("生日：\(user.birthday,formatter: dataFormatter)")
                }
            } else {//编辑状态
                MineEdit(userCopy: $userCopy)
                    .onDisappear(){
                        self.userCopy = self.user
                    }
                
            }
        }
        .padding()
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}
