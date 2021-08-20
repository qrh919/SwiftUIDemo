//
//  Test1View.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/12.
//  主视图

import SwiftUI

struct Test1View: View {
    var body: some View {
        NavigationView{
            List(testArr){ model in
                TestCell(model: model)
            }
            .navigationBarTitle(Text("世界地标"))
        }
    }
}

struct Test1View_Previews: PreviewProvider {
    static var previews: some View {
        Test1View()
    }
}


struct TestCell: View {
    let model : TestModel
    var body : some View {
        NavigationLink(destination:TestDetailView(data: model)){
            Image(systemName: model.imageName).cornerRadius(5)
            VStack{
                Text(model.name)
                    .bold()
                Text(model.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
