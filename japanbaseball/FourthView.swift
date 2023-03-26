//
//  FourthView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct FourthView: View {
    //選手情報
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Image("fire")
                        .resizable()
                        .frame(width: 400,height: 200)
                    Text("選手選択")
                        .font(.custom("ZenAntique-Regular",size:50))
                        .foregroundColor(.white)
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment:.top, spacing: 5){
                        PlayerButton(No: 0)
                        PlayerButton(No: 1)
                        PlayerButton(No: 2)
                        PlayerButton(No: 0)
                        PlayerButton(No: 1)
                        PlayerButton(No: 2)
                        
                    }
                }
            }
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}

struct PlayerButton: View {
    @State private var isPresented: Bool = false
    private let player = PlayerData()
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
                            Image(player.image[No])
                                .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 250.0, height: 300.0, alignment: .center)
                               .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                  }
               }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                PlayerView(No:No)
        }
    }
}

struct PlayerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    private let player = PlayerData()
    var No:Int
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Image(player.image[No])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200,height: 300)
                Group{
                    ScrollView(.vertical){
                        Group{
                            Text("名前:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.name[0])
                            Text("背番号:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.no[0])
                            Text("生年月日:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.birthday[0])
                        }
                        Group{
                            Text("年齢:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.age[0])
                            Text("身長/体重:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.tall[0])
                            Text("投/打")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue)
                            Text(player.arm[0])
                        }
                    }
                    }
                Spacer()
                DismissButton()
            }
            .foregroundColor(.white)
        }
    }
}
