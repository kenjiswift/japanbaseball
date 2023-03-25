//
//  ContentView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            //FirstView
            Text("First View")
                .font(.title)
                .tabItem{
                    VStack{
                        Image(systemName: "tray.fill")
                        Text("最新ニュース")
                    }
                }
                .tag(SelectView.first)
            
            //SecondView
            Text("Second View")
                .font(.title)
                .tabItem{
                    VStack{
                        Image(systemName: "paperplane")
                        Text("選手情報")
                    }
                }
                .tag(SelectView.second)
            
            //ThirdView
            Text("Third View")
                .font(.title)
                .tabItem{
                    VStack{
                        Image(systemName: "tray.and.arrow.up.fill")
                        Text("ドーム情報")
                    }
                }
                .tag(SelectView.third)
        }
        
    }
}


enum SelectView{
    case first,second,third
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
