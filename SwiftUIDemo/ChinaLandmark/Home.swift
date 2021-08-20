//
//  Home.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/18.
//

import SwiftUI

struct Home: View {
    //将数组按category进行分组 到字典里面
    var categroies : [String : [Landmark]]{
        .init(grouping: landmarks) {$0.category
        }
    }
    //绑定变量用于Present视图
    @State var showMine = false
    
    var body: some View {
        NavigationView{
            List{
//                Image(systemName: "photo")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height:200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())//去掉边距
                
                PageVC()
                    .frame(height:200)
                    .listRowInsets(EdgeInsets())//去掉边距
                
                ForEach(categroies.keys.sorted(),id: \.self){categoryName in
                    CategroyCell(categoryName: categoryName, landmarks: self.categroies[categoryName]!)
                }
                .listRowInsets(EdgeInsets())//去掉边距
                
                NavigationLink(
                    destination: LandmarkList()
                        .environmentObject(UserData())){
                    Text("查看地标")
                }
            }
            .navigationBarTitle(Text("首页"))
            .navigationBarItems(trailing:
                Image(systemName: "person.crop.circle")
                                    .imageScale(.large)
                                    .padding()
                                    .onTapGesture {
                                        self.showMine.toggle()
                                    }
            ).sheet(isPresented: $showMine, content: {
                Mine()
            })
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        //设置暗黑
//        Home().environment(\.colorScheme, .dark)
        //设置系统字体
//        Home().environment(\.sizeCategory, .accessibilityExtraLarge)
    }
}

//可单独提出来
struct CategroyCell: View {
    
    let categoryName : String
    let landmarks : [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(categoryName).font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:15){
                    
                    ForEach(landmarks){
                        landmark in
                        CategroyCellItem(landmark: landmark)
                        
                    }
                }
            }
        }
        .padding(.leading, 15)
        .padding([.top, .bottom])
    }
}

//可单独提出来
struct CategroyCellItem: View {
    
    let landmark : Landmark
    
    var body: some View {
        //NavigationLink未被NavigationView嵌套时需要修改子控件的渲染颜色
        NavigationLink(
            destination: Text("Destination")){
            VStack(alignment: .leading){
                Image(systemName: "photo")
                    .renderingMode(.original)//修改渲染颜色
                    .resizable()
                    .scaledToFit()
                    .frame(width:155,height:155)
                    .cornerRadius(5)
                Text(landmark.name)
                    .font(.caption)
                    .foregroundColor(.primary)//修改渲染颜色
            }
        }
    }
}
