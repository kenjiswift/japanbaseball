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
                    Color(.black)
                        .ignoresSafeArea()
                    VStack{
                        Text("ヘッドラインNEWS")
                            .font(.custom("ZenAntique-Regular", size: 30))
                            .foregroundColor(.white)
                        ScrollView(.vertical){
                            newsView(newsNo: 0)
                            newsView(newsNo: 1)
                            newsView(newsNo: 2)
                            newsView(newsNo: 3)
                            newsView(newsNo: 4)
                }
            }
        }
    }
}
    struct NextView: View {
        @Environment(\.dismiss) private var dismiss
        @State private var isPresented: Bool = false
        let newsNo:Int
        let news = NewsData()
        var body: some View {
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                ScrollView(.vertical){
                    VStack{
                        Image(news.image[newsNo])
                        Text(news.title[newsNo])
                        Text(news.text[newsNo])
                            .font(.custom("ZenAntique-Regular",size:20))
                            .foregroundColor(.white)
                            .frame(width: 350)
                        Button {
                            dismiss()
                        } label: {
                            Text("back")
                        }
                    }
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
struct newsView: View {
    @State private var isPresented: Bool = false
    let news = NewsData()
    let newsNo:Int
 
    var body: some View {
        Button(action: {isPresented = true //trueにしないと画面遷移されない
            }) {
                ZStack{
                    Rectangle()
                        .stroke(lineWidth: 2)
                        .fill(.red)
                    VStack {
                        HStack{
                            Image(news.image[newsNo])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160.0, height: 120.0, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            Text(news.title[newsNo])
                                .font(.custom("ZenAntique-Regular",size:20))
                                .foregroundColor(.white)
                                .fontWeight(.thin)
                                .frame(width: 200,height:140)
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                NextView(newsNo: newsNo)
            }
        }
    }
}
