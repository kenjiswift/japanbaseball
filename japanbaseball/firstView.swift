//
//  firstView.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/25.
//

import SwiftUI

struct firstView: View {
    var body: some View {
        NavigationView{
           
            ZStack{
                GeometryReader{ geometry in
                    Color(.black)
                        .ignoresSafeArea()
                    VStack{
                        Text("ヘッドラインNEWS")
                            .font(.custom("ZenAntique-Regular", size: 30))
                            .foregroundColor(.white)
                        ScrollView(.vertical){
                            let news = News()
                            newsView(imageName: news.image[0],Name: news.title[0] )
                            newsView(imageName: news.image[1],Name: news.title[1] )
                            newsView(imageName: news.image[2],Name: news.title[2] )
                            newsView(imageName: news.image[3],Name: news.title[3] )
                            newsView(imageName: news.image[4],Name: news.title[4] )

                    }
                }
            }
        }
    }
}
struct NextView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    var body: some View {
        Text("NextView")
        Button {
            dismiss()
        } label: {
            Text("mae")
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
struct newsView: View {
    @State private var isPresented: Bool = false
    let imageName: String
    let Name: String
 
    var body: some View {
        Button(action: {isPresented = true //trueにしないと画面遷移されない
            }) {
                ZStack{
                    Rectangle()
                        .stroke(lineWidth: 2)
                        .fill(.red)
                    VStack {
                        HStack{
                            Image("\(imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160.0, height: 120.0, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            Text("\(Name)")
                                .font(.custom("ZenAntique-Regular",size:20))
                                .foregroundColor(.white)
                                .fontWeight(.thin)
                                .frame(width: 200,height:140)
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                NextView()
            }
        }
    }
}
