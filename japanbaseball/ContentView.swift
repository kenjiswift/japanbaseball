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
                    Text("最新ニュース")
                }
                .tag(SelectView.first)
            
            SecondView()
                .tabItem{
                    Image(systemName: "paperplane")
                    Text("選手情報")
                }
                .tag(SelectView.second)
            
           ThirdView()
                .tabItem{
                    Image(systemName: "tray.and.arrow.up.fill")
                    Text("ドーム情報")
                }
                .tag(SelectView.third)
            FourthView()
                 .tabItem{
                     Image(systemName: "xmark.bin.circle.fill")
                     Text("ドーム情報")
                 }
                 .tag(SelectView.third)
            FifthView()
                 .tabItem{
                     Image(systemName: "archivebox.fill")
                     Text("ドーム情報")
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
