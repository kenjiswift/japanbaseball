//
//  firstView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct firstView: View {
    @State private var news = ["ニュース１","ニュース２","ニュース３","ニュース４","ニュース5"]
    var body: some View {
        NavigationView{
            VStack{
                Text("現在の試合状況")
                List{
                    FightView(teamA: "阪神", teamB: "巨人",time: "13:00")
                    FightView(teamA: "中日", teamB: "ヤクルト",time: "13:00")
                    FightView(teamA: "広島", teamB: "ソフトバンク",time: "13:00")
                    FightView(teamA: "オリックス", teamB: "ライオンズ",time: "13:00")
                }
                Spacer()
                
                Text("ヘッドラインNEWS")
                
                List{
                    ForEach(news, id:\.self){ new in
                        NavigationLink(destination: DetailView(name: new)){
                            Text(new)
                        }
                    }
                }
                .navigationBarTitle("最新情報")
            }
        }
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
                                   
struct DetailView:View{
    var name:String = "hellow"
    var body:some View {
    Text(name).font(.system(size:30))
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
            Spacer()
            Text(time)
            Spacer()
            Text(teamB)
            Spacer()
        }
        .font(.headline)
        .multilineTextAlignment(.center)
    }
}
