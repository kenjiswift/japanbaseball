//
//  firstView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct firstView: View {
    var body: some View {
        VStack{
            Text("firstView")
                .font(.title)
            Image(systemName: "externaldrive.badge.wifi")
            }
        }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
