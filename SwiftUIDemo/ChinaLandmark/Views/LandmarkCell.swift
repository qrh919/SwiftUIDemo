//
//  LandmarkCell.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/17.
//

import SwiftUI

struct LandmarkCell: View {
    let landmark : Landmark
    var body: some View {
        HStack {
            NavigationLink(
                destination: LandmarkDetail(landmark: landmark)){
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                Text(landmark.name)
                Spacer()
                if landmark.isFavorite{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct LandmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkCell(landmark: landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
