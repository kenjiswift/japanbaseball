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
            firstView()
                .tabItem{
                    Image(systemName: "tray.fill")
                    Text("最新情報")
                }
                .tag(SelectView.first)
            
            SecondView()
                .tabItem{
                    Image(systemName: "paperplane")
                    Text("球団情報")
                }
                .tag(SelectView.second)
            
            ThirdView()
                .tabItem{
                    Image(systemName: "tray.and.arrow.up.fill")
                    Text("試合実況")
                   
                }
                .tag(SelectView.third)
            FourthView()
                .tabItem{
                    Image(systemName: "xmark.bin.circle.fill")
                    Text("選手情報")
                    
                }
                .tag(SelectView.fourth)
            FifthView()
                .tabItem{
                    Image(systemName: "archivebox.fill")
                    Text("ドーム情報")
                }
                .tag(SelectView.fifth)
            
        }
    }
}


enum SelectView{
    case first,second,third,fourth,fifth
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
