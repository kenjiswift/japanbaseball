//
//  ThirdView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack{
            Text("試合実況")
                .font(.custom("ZenAntique-Regular", size: 50))
               List{
                FightView(teamA: "阪神", teamB: "巨人",time: "13:00")
                FightView(teamA: "中日", teamB: "ヤクルト",time: "13:00")
                FightView(teamA: "広島", teamB: "ソフトバンク",time: "13:00")
                FightView(teamA: "オリックス", teamB: "ライオンズ",time: "13:00")
            }
            
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

struct FightView: View{
    var teamA:String
    var teamB:String
    var time :String
    var body:some View{
            HStack{
                Spacer()
                Text(teamA)
                    .font(.custom("ZenAntique-Regular", size: 17))
                Spacer()
                Text(time)
                Spacer()
                Text(teamB)
                    .font(.custom("ZenAntique-Regular", size: 17))
                Spacer()
            }
            
            .font(.headline)
            .multilineTextAlignment(.center)
            .font(.custom("ZenAntique-Regular", size: 17))
    }
}
