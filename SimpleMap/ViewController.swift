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
    
    var foodStoreAddress = ["부산광역시 부산진구 양정2동 336-17",
                            "부산광역시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 353-38"]
    var foodStoreNames = ["늘해랑",
                          "번개반점",
                          "아딸",
                          "왕짜장",
                          "토마토 도시락",
                          "홍콩반점"]
    
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var i = 0
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
                    annotation.subtitle = self.foodStoreNames[i]
                    i = i + 1
                    self.annotations.append(annotation)
                    self.myMapView.addAnnotations(self.annotations)
                    self.myMapView.showAnnotations(self.annotations, animated: true)
                    
//                    print(annotation.title)
//                    self.myMapView.addAnnotation(annotation)
                    //self.myMapView.selectAnnotation(annotation, animated: true)
                    
                    // zoom level
//                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 700, 700)
//                    self.myMapView.setRegion(region, animated: true)
                    //self.myMapView.selectAnnotation(self.annotations[3], animated: true)
//                    self.myMapView.selectAnnotation(self.annotations[0], animated: true)

                } else {
                    print("loc nil 발생")
                }
            }
        }

    }
}

