//
//  productIntros.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 16/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit
import WebKit

class productIntros: UIViewController {

    @IBAction func openMenu(_ sender: Any) {
        revealViewController().revealToggle(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About Accomplisher"
        
        setColor()
        addPDFWebview()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setColor(){
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    func addPDFWebview(){
        let pdf = Bundle.main.url(forResource: "accomplisher product introdution book in chinese edition", withExtension: "pdf")
        let req = URLRequest(url: pdf!)
        
        let webView = WKWebView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        webView.load(req)
            

        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
            
            
        webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.view = nil
    }
        
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

