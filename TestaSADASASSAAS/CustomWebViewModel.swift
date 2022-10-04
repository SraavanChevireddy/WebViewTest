//
//  CustomWebViewModel.swift
//  TestaSADASASSAAS
//
//  Created by Sraavan Chevireddy on 10/4/22.
//

import Foundation
import Combine
import SwiftUI

//MARK: This file should only contain the configuration that is required for the WebView.

class CustomWebViewModel : ObservableObject{
    
    public static var shared = CustomWebViewModel()
    
    private var reqeust:URLRequest!
    @Published var urlForResource:URL!
    
    var headers: Dictionary<String, String>!

    func setCookies(for key:String,_ value: AnyObject)->HTTPCookie?{
        guard let urlForResource = urlForResource, let host = urlForResource.host else{
            return nil
        }
        return HTTPCookie(properties: [
            .domain: host,
            .path: "/",
            .name: key,
            .value: value,
            .secure: "TRUE",
        ])
    }
    
    func load() throws -> URLRequest{
        guard let urlForResource = urlForResource else{
            throw URLError(.badURL)
        }
        var request = URLRequest(url: urlForResource)
        request.httpShouldHandleCookies = true
        return request
    }

}
