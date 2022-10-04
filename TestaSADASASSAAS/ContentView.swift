//
//  ContentView.swift
//  TestaSADASASSAAS
//
//  Created by Sraavan Chevireddy on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WebViewTwo(url: URL(string: "https://www.google.com"), source: .login) {
                print("Do anything you want after view is loaded!")
            } content: {
                ProgressView("Loading")
            }
            .navigationTitle("WebView")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
