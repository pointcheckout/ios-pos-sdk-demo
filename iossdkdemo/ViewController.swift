//
//  ViewController.swift
//  iossdkdemo
//
//  Created by Abdullah Asendar on 7/1/19.
//  Copyright © 2019 PointCheckout. All rights reserved.
//

import UIKit
import PointCheckoutSdk

class ViewController: UIViewController, PaymentDelegate {
    
    @IBOutlet weak var btnCheckout: UIButton!
    @IBOutlet weak var txtTotal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func checkout(_ sender: UIButton) {
        
        
        
        let apiKey: String = "PC_API_KEY"
        let apiSecret: String = "PC_API_SECRET"
        let googleAppID: String = "GOOGLE_APP_ID"
        
        let client: PointCheckoutClient = PointCheckoutClient(environment: PointCheckoutEnvironment.TEST, apiKey: apiKey, apiSecret: apiSecret, googleAppID: googleAppID )
        
        let id = Int.random(in: 0..<100000000000);
        let id2 = Int.random(in: 0..<100000000000);
                
        let total = Double(self.txtTotal.text ?? "20.0") ?? 20
        
        let checkout: CheckoutRequest = CheckoutRequest(referenceId: "\(id)-\(id2)", currency: "AED", grandtotal: total, subtotal: total, deviceReference: "TEST")
        
        do {
            try client.pay(checkout: checkout, paymentDelegate: self, controller: self)
        } catch {
            print("error")
        }
        
    }
    
    func onSuccess(checkoutResponse: CheckoutResponse){
        print("Success")
    }
    func onCancel(){
        print("cancelled")

        
    }
    func onError(message: String){
        print("Error: \(message)")

    }
    
}


