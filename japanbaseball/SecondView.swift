//
//  SecondView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Image("fire")
                        .resizable()
                        .frame(width: 400,height: 200)
                    Text("球団情報")
                        .foregroundColor(.white)
                        .font(.custom("ZenAntique-Regular",size:50))
                   
                }
                ScrollView(.horizontal){
                    HStack{
                            ForEach(0..<12) { num in
                                LogoButton(No:num)
                            }
                    }
                }
            }
        }
    }
}
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

struct LogoButton: View {
    @State private var isPresented: Bool = false
    private let logo = LogoData()
    var No:Int
  
    var body: some View {
        Button(action: {isPresented = true
            }) {
                ZStack{
                    Rectangle()
                        .stroke(lineWidth: 5)
                        .fill(.red)
                        .frame(width: 100, height: 300, alignment: .center)
                    VStack {
                        HStack{
                            Image(logo.image[No])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 300, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                  }
               }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                TeamView(No:No)
        }
    }
}

struct TeamView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    private let logo = LogoData()
    private let team = TeamData()
    var No:Int
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Image(logo.image[No])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300,height: 300)
                Group{
                    ScrollView(.vertical){
                        Text("正式名称:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.blue)
                        Text(team.name[0])
                        Text("略称:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.blue)
                        Text(team.shortName[0])
                        Text("本拠地:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.blue)
                        Text(team.base[0])
                        Text("歴史:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.blue)
                        Text(team.history[0])
                    }
                    }
                Spacer()
                DismissButton()
            }
            .foregroundColor(.white)
        }
    }
}
