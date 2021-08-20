//
//  TestDetailView.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/13.
//  详情

import SwiftUI

struct TestDetailView: View {
    //此处添加对象属性
    let data : TestModel
    // 变量 是否缩放 结构体对象为值类型 初始化完成后不可修改属性值，所以此处需要添加state修饰符，state修饰后修改值后界面会自动刷新
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image(systemName: data.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(data.name,displayMode: .inline)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .onTapGesture {
                    withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                        zoomed.toggle()
                    }
                }
            if !zoomed{
                Text(data.location)
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 20))
                    .transition(.move(edge: .trailing))
            }
            
            
            Text(data.id.uuidString)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .font(.system(size: 10))
                .padding()
        }
    }
}

struct TestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TestDetailView(data: testArr[1])
    }
}
