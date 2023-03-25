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
            Text("ThirdView")
                .font(.title)
            Image(systemName: "internaldrive")
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
