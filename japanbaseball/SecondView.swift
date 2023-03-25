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
                Text("球団情報")
                ScrollView(.horizontal){
                HStack{
                    LogoButton(imageName: "阪神")
                    LogoButton(imageName: "巨人")
                    LogoButton(imageName: "ヤクルト")
                    LogoButton(imageName: "オリックス")
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
    let imageName: String
 
    var body: some View {
        Button(action: {isPresented = true //trueにしないと画面遷移されない
            }) {
                ZStack{
                    Rectangle()
                        .stroke(lineWidth: 2)
                        .fill(.red)
                        .frame(width: 100, height: 300, alignment: .center)
                    VStack {
                        HStack{
                            Image("\(imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
          
                                .frame(width: 100, height: 300, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                  }
               }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                NextView()
            }
        }
    }

struct NextView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    var body: some View {
        Text("NextView")
        Button {
            dismiss()
        } label: {
            Text("mae")
        }
    }
}
