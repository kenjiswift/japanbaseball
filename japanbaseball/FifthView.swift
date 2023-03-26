//
//  FifthView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct FifthView: View {
    let UINFGenerator = UINotificationFeedbackGenerator()
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Text("野球を観戦してポイントをGETしよう！！")
                    .font(.custom("ZenAntique-Regular",size:30))
                Text("▷詳しく見る(未実装）")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                //無駄にQRコードを振動させてみた！！
                Button(action: {
                    UINFGenerator.notificationOccurred(.success)
                }) {
                    Image("QR")
                        .resizable()
                    .frame(width: 200,height: 200)}
                Text("ゴールドステージ")
                    .font(.custom("ZenAntique-Regular",size:20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("ベースボールポイント")
                    .font(.custom("ZenAntique-Regular",size:15))
                    .frame(maxWidth: .infinity, alignment: .leading)

                BaseballPoint(point: 100)
                Text("あと1000ベースボールポイントでプラチナステージ！")
                    .font(.custom("ZenAntique-Regular",size:15))
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .foregroundColor(.white)
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}


struct BaseballPoint: View {
    @State var point :CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Capsule()
                .foregroundColor(.red)
                .frame(width: 380,height: 20)
            Capsule()
                .foregroundColor(.white)
                .frame(width: point,height: 20)
            Text(String(Int(point)))
                .frame(width: 50,height: 20)
                .foregroundColor(.black)
        }
    }
}
