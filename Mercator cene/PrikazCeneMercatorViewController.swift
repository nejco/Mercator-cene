//
//  PrikazCeneViewController.swift
//  Mercator cene
//
//  Created by Nejc Vidrih on 03/11/2016.
//  Copyright © 2016 Nejc Vidrih. All rights reserved.
//

import UIKit

class PrikazCeneMercatorViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = Static.code {
            
            let urls = "https://trgovina.mercator.si/market/brskaj#search=\(k)"
            
            let url = URL(string: urls)!
            
            self.webView.loadRequest(URLRequest(url: url))
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
