//
//  ThirdView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Text("試合実況")
                    .foregroundColor(.white)
                    .font(.custom("ZenAntique-Regular", size: 50))
                Text("みんなで試合観戦し、選手を応援しよう！！")
                Text("下の試合を選んで、Tweetしよう！")
                
                FightButton(figthNo: 0)
                FightButton(figthNo: 1)
                FightButton(figthNo: 2)
                FightButton(figthNo: 3)
            }
                .foregroundColor(.white)
        
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
        TweetView(figthNo: 0)
    }
}


struct FightButton: View {
    @State private var isPresented: Bool = false
    private let data = FightData()
    private let tweet = TweetData()
    var figthNo :Int
    
    var body: some View {
        Button(action: {isPresented = true //trueにしないと画面遷移されない
        }) {
            ZStack{
                Rectangle()
                    .stroke(lineWidth: 2)
                    .fill(.red)
                    .frame(width: 390, height: 100, alignment: .center)
                VStack{
                    HStack{
                        Spacer()
                        Text(data.teamAndTime[figthNo][0])
                            .frame(width: 150, height: 50, alignment: .center)
                            .font(.custom("ZenAntique-Regular",size:20))
                        Spacer()
                        Text(data.teamAndTime[figthNo][2])
                            .font(.custom("ZenAntique-Regular",size:20))
                        Spacer()
                        Text(data.teamAndTime[figthNo][1])
                            .frame(width: 150, height: 50, alignment: .center)
                            .font(.custom("ZenAntique-Regular",size:20))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    HStack{
                        Text("最新Tweet：")
                        Spacer()
                        Text(tweet.new[figthNo])
                        Spacer()
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                TweetView(figthNo: figthNo)
            }
        }
    }
}

struct TweetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    @State private var mytweet:String = ""
    var figthNo :Int
    private let data = FightData()
    private let tweet = TweetData()
  
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            Group{
                fightView(figthNo: figthNo)
                    .position(x:200,y:0)
                DismissButton()
                    .position(x:200,y:50)
                Spacer()
            }
            Group{
                ScrollView(.vertical){
                    ForEach(0..<30) { num in
                        ZStack{
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .fill(.red)
                            VStack{
                                HStack{
                                    Text(tweet.name[num])
                                    Text(tweet.allTweet[num])
                                }
                                Text(tweet.time[num])
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
                .frame(width: 300, height: 500, alignment: .center)
                .position(x:200,y:400)
            }
            Group{
                TextField("tweetを入力して下さい",text: $mytweet)
                    .frame(width: 250, height: 50, alignment: .leading)
                    .position(x:180,y:700)
                    .foregroundColor(.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.twitter)
                Button(action: {print("")}){ Text("Tweet")}
                    .padding()
                    .frame(width: 80, height: 40, alignment: .center)
                    .background(Color.green)
                    .accentColor(Color.white)
                    .cornerRadius(26)
                    .shadow(color: Color.green, radius: 15, x: 0, y: 5)
                    .position(x:350,y:700)
                DismissButton()
                    .position(x:200,y:750)
                
            }
        }
    }
}

struct fightView :View {
    private let data = FightData()
    var figthNo :Int
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Text(data.teamAndTime[figthNo][0])
                        .frame(width: 130, height: 50, alignment: .center)
                        .font(.custom("ZenAntique-Regular",size:20))
                    Spacer()
                    Text(data.teamAndTime[figthNo][2])
                        .font(.custom("ZenAntique-Regular",size:20))
                    Spacer()
                    Text(data.teamAndTime[figthNo][1])
                        .frame(width: 130, height: 50, alignment: .center)
                        .font(.custom("ZenAntique-Regular",size:20))
                    Spacer()
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            }
        }
    }
}
