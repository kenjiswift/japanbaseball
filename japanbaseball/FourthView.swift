//
//  FourthView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct FourthView: View {
    //選手情報
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment:.top, spacing: 5){
                        ChildView(imageName: "13", Name: "fdaa")
                        Image("13")
                        Image("14")
                        Image("15")
                    }
                }
                
            }
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
struct ChildView: View {
    
    let imageName: String
    let Name: String
 
    var body: some View {
        VStack {
            Image("\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250.0, height: 300.0, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("\(Name)")
                .font(.custom("ZenAntique-Regular",size:20))
                    .fontWeight(.thin)
        }
//        .colorInvert()
    }
}
