//
//  WebViewTwo.swift
//  TestaSADASASSAAS
//
//  Created by Sraavan Chevireddy on 10/4/22.
//

import SwiftUI

struct WebViewTwo<Content:View>: View {
    let content : Content
    var url:URL!
    var source:WebviewRequestSource!
    var onFinish : (()->())? = nil
    
    // WebviewData store
    @ObservedObject var webVM = CustomWebViewModel.shared
    
    @State private var showLoader = true
    
    /// `init(:_)`
    init(url: URL!, source: WebviewRequestSource!, onFinish: ( () -> Void)? = nil, @ViewBuilder content: () -> Content) {
        self.url = url
        self.source = source
        self.onFinish = onFinish
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            CustomWebView(url: url, of: source) {
                onFinish?()
            }
            if showLoader{
                content
            }
        }
    }
}
