//
//  WebViewVC.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 17/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var urlWebView: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(URLRequest(url: URL(string: urlWebView)!))
    }
    

}
