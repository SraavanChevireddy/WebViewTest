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
    
    var headers: Dictionary<String, String>!

    func setCookies(for key:String,_ value: AnyObject)->HTTPCookie{
        #warning("Add actual base URL here")
        return HTTPCookie(properties: [
            .domain: "sads",
            .path: "/",
            .name: key,
            .value: value,
            .secure: "TRUE",
        ])!
    }
    

}
