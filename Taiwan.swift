import SwiftUI
import AVKit
import WebKit

struct Tideo: Identifiable{
    let id = UUID()
    let name: String
    let url: String
    let singer: String
}

struct Taiwan: View{
     
    let tideos = [
        Tideo(name: "訣愛", url: "dT9kcdelG04", singer: "詹雯婷"),
        Tideo(name: "家後", url: "rBwmk2zzIy8", singer: "江蕙/阿杜"),
        Tideo(name: "她的背影", url: "m4V1-j2hedE", singer: "王傑"),
        Tideo(name: "心裡有針", url: "gqpGr_QlUR0", singer: "蕭煌奇"),
        Tideo(name: "夢中的情話", url: "Zg3SEaYLq5Y", singer: "江蕙"),
        Tideo(name: "真情話", url: "7HxmljnwTOA", singer: "施文彬"),
        Tideo(name: "反背", url: "PAREZioJE-M", singer: "王識賢"),
        Tideo(name: "送予你的歌", url: "uwBpXyWGDh4", singer: "蕭煌奇")
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                let columns = [GridItem(.adaptive(minimum: 150))]
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(tideos) {
                        tideo in NavigationLink(
                            destination: TideoView(tideo: tideo),
                            label: {
                                VStack{
                                    Rectangle()
                                        .aspectRatio(5/3, contentMode: .fit)
                                        .overlay(
                                            Image(tideo.name)
                                                .resizable()
                                                .scaledToFill()
                                        )
                                        .clipped()
                                        .padding()
                                    Text(tideo.name)
                                    Text(tideo.singer)
                                }
                            })
                    }
                }
            }.navigationBarTitle("台灣歌")
        }
    }
        
        struct TideoView: View {
            let tideo: Tideo
            var body: some View {
                tideoView(tideoID: tideo.url)
            }
        }
    struct tideoView: UIViewRepresentable{
        let tideoID: String
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        func updateUIView(_ uiView: WKWebView, context: Context) {
            guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(tideoID)") else {return}
            uiView.scrollView.isScrollEnabled = false
            uiView.load(URLRequest(url: youtubeURL))
        }
    }
}

