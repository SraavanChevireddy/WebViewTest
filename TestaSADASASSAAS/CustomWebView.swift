//
//  CustomWebView.swift
//  TestaSADASASSAAS
//
//  Created by Sraavan Chevireddy on 10/4/22.
//

import SwiftUI
import Foundation
import UIKit
import WebKit

struct CustomWebView : UIViewRepresentable{

    typealias UIViewType = WKWebView
    
    var url:URL!
    var type:WebviewRequestSource!
    var onFinish: (()->())? = nil
    
    // WebviewData store
    @ObservedObject var webVM = CustomWebViewModel.shared
    
    /// Initialzes the webview from the `WKWebView` and sets the `WebviewRequestSource` as default. This created a default configuration.
    /// - Parameters:
    ///   - url: Payload that has to be displayed on the WebView.
    ///   - type: The type of request that is made on the webView. For now we are handling only for request type `WebviewRequestSource.login`inorder to store the information in view.
    ///   - onFinish: The optional completion block that finished the action that has to be performed after the webview is loaded successfully.
    public init(url: URL!, of type:WebviewRequestSource, onFinish: (()->())? = nil) {
        self.url = url
        self.type = type
        self.onFinish = onFinish
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let wkwebview = WKWebView()
        wkwebview.navigationDelegate = context.coordinator
        return wkwebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        debugPrint("context updated")
        webVM.urlForResource = url
        do{
            uiView.load(try webVM.load())
        }catch{
            debugPrint(error.localizedDescription)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, WKNavigationDelegate {
        var parent: CustomWebView
        
        init(_ parent: CustomWebView) {
            self.parent = parent
        }
        
        //MARK: WebView delegate methods
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // To allow the telephone call from URL scheme.
            if navigationAction.request.url?.scheme == "tel" {
                UIApplication.shared.open(navigationAction.request.url!)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.onFinish?()
            if parent.type == .login{
                
                // Post the login response to the model.
            }
        }
    }
    
}

enum WebviewRequestSource{
    case login
    case profile
    case makepayments
    case `default`
}
