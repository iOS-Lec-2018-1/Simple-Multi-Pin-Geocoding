//
//  ViewController.swift
//  SimpleMap
//
//  Created by 김종현 on 2018. 6. 3..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMapView: MKMapView!
    
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 353-38"]
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for addr in foodStoreAddress {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let error = error {
                    print(error)
                    return
                }
                
                let placemark = placemarks![0]
                if let loc = placemark.location {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = loc.coordinate
                    annotation.title = addr
                    self.annotations.append(annotation)
                    self.myMapView.addAnnotations(self.annotations)
                    self.myMapView.showAnnotations(self.annotations, animated: true)
                }
            }
        }
    }
}

