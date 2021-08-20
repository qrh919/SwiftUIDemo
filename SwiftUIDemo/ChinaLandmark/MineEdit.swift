//
//  MineEdit.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/19.
//

import SwiftUI

struct MineEdit: View {
    
    /// 传值需要 设置绑定传值类型
    @Binding var userCopy:User
    
    var body: some View {
        List{
            HStack{
                Text("昵称")
                Divider()
                TextField("昵称",text:$userCopy.username)
            }
            Toggle(isOn: $userCopy.prefersNotifications, label: {
                Text("允许通知")
            })
            VStack(alignment: .leading){
                Text("喜欢的季节")
                Picker("season", selection: $userCopy.prefersSeason){
                    ForEach(User.Season.allCases, id: \.self){season in
                        Text(season.rawValue).tag(season)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            VStack(alignment:.leading){
                Text("生日").bold()
                DatePicker("date", selection: $userCopy.birthday, displayedComponents:.date)
            }
            .padding(.top)
        }
    }
}

struct MineEdit_Previews: PreviewProvider {
    static var previews: some View {
        MineEdit(userCopy: .constant(.default))
    }
}
