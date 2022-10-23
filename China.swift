//
//  China.swift
//  book
//
//  Created by Caren Chin on 2022/10/22.
//

import SwiftUI
import AVKit
import WebKit

struct Video: Identifiable{
    let id = UUID()
    let name: String
    let url: String
    let singer: String
}

struct China: View{
     
    let videos = [
        Video(name: "從前說", url: "9ZHXuIARsIo", singer: "小阿七"),
        Video(name: "熱戀冰淇淋", url: "RJQUkuUloR4", singer: "苡慧"),
        Video(name: "目及皆是你", url: "2Xfm7edS7rY", singer: "小藍背心"),
        Video(name: "致你", url: "tVpqBkxwCfI", singer: "苡慧"),
        Video(name: "就忘了吧", url: "APn5NuP59NA", singer: "歪歪"),
        Video(name: "我不是劉德華", url: "gj9jOlYhjTQ", singer: "新地/盧克"),
        Video(name: "身後", url: "to7w5XvTRVE", singer: "space X"),
        Video(name: "TA", url: "gTw3jQz_nK0", singer: "不是花火呀")
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                let columns = [GridItem(.adaptive(minimum: 150))]
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(videos) {
                        video in NavigationLink(
                            destination: VideoView(video: video),
                            label: {
                                VStack{
                                    Rectangle()
                                        .aspectRatio(5/3, contentMode: .fit)
                                        .overlay(
                                            Image(video.name)
                                                .resizable()
                                                .scaledToFill()
                                        )
                                        .clipped()
                                        .padding()
                                    Text(video.name)
                                    Text(video.singer)
                                }
                            })
                    }
                }
            }.navigationBarTitle("抖音歌")
        }
    }
        
        struct VideoView: View {
            let video: Video
            var body: some View {
                videoView(videoID: video.url)
            }
        }
    struct videoView: UIViewRepresentable{
        let videoID: String
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        func updateUIView(_ uiView: WKWebView, context: Context) {
            guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
            uiView.scrollView.isScrollEnabled = false
            uiView.load(URLRequest(url: youtubeURL))
        }
    }
}
