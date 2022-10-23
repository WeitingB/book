//
//  ContentView.swift
//  book
//
//  Created by Caren Chin on 2022/10/22.
//

import SwiftUI
import AVKit
struct ContentView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem{
                Label("主頁", systemImage: "music.house.fill")
                }
            China()
                .tabItem {
                Label("抖音歌", systemImage: "music.note.list")
                }
            Taiwan()
                .tabItem {
                Label("台灣歌", systemImage: "music.quarternote.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
