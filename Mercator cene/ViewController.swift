//
//  ViewController.swift
//  Mercator cene
//
//  Created by Nejc Vidrih on 03/11/2016.
//  Copyright © 2016 Nejc Vidrih. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift

class ViewController: RSCodeReaderViewController {
    
    var led = false
    
    var koda:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.focusMarkLayer.strokeColor = UIColor.red.cgColor
        
        self.cornersLayer.strokeColor = UIColor.yellow.cgColor
        
        self.tapHandler = { point in
            print(point)
        }
        
        self.barcodesHandler = { barcodes in
            
            
            DispatchQueue.main.async {
                
                if let code = barcodes.first?.stringValue {
                    self.koda = code
                    self.performSegue(withIdentifier: "prehod1", sender: nil)
//                    print("Async1 \(code)")

                }
            }
            
            self.session.stopRunning()

            
        }
        
        
        
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "prehod1") {
            let svc = segue.destination as! PrikazCeneViewController;
            if let k = koda {
                svc.koda = k

            }
            
        }
        
        
    }

    @IBAction func LED(_ sender: Any) {
        led = !led
        toggleTorch(on: led)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

