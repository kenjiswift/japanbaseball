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
            }
        }
    }
}
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
