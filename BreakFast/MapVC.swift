//
//  MapVC.swift
//  BreakFast
//
//  Created by karmaa lab on 26/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Alamofire
import SwiftyJSON
import MapKit
class MapVC: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, UITextFieldDelegate {

    @IBOutlet var nxtBtn: UIButton!
    @IBOutlet  var myMapView: GMSMapView!
    
    @IBOutlet var addressLbl: UILabel!
    let locationManager = CLLocationManager()
    @IBOutlet var searchText: UITextField!
    var currentLocationMarker: GMSMarker?
    var map : GMSMapView?
    var token = ""
    var gpsLocationMarker = GMSMarker()
    var position: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var pinPosition: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var userPin = UIImageView(image: UIImage(named: "marker-24"))
    var positionSet: Bool = false
    var lastPinPosition: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var windowOpen:Bool = false
    let callDistance:Float = 4000 //4 km
    var userZoomLevel: Float? = 10
    var update_address = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        myMapView.isMyLocationEnabled = true
        myMapView.settings.myLocationButton = true
        // Do any additional setup after loading the view.
        nxtBtn.layer.cornerRadius = 20
//        setUpMap()
    }
    
    func setUpMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 0.0,longitude:0.0, zoom:14)
        self.myMapView = GMSMapView.map(withFrame: CGRect.zero, camera:camera)
        self.myMapView?.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        userPin.frame = CGRect(x: 110, y: 110, width: 100, height: 200)
        myMapView.addSubview(userPin)

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.position = manager.location!.coordinate
        print(position)
        self.gpsLocationMarker.map = nil
        self.gpsLocationMarker = GMSMarker(position:self.position)
        self.gpsLocationMarker.title = "My Location"
        self.gpsLocationMarker.icon = UIImage(named: "currentLocation")
        self.gpsLocationMarker.map = myMapView
        self.gpsLocationMarker.zIndex = -10
        self.gpsLocationMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        //        if(!self.positionSet) {
        //
        //            self.positionSet = true
        //        }
        if(!self.positionSet) {
            setUserCurrentLocation()
            //            setSalonLocation()
            
            //            updateCameraPosition()
            self.positionSet = true
        }
        
    }
    
    func setUserCurrentLocation() {
        print(position)
        print(position.latitude)
        print(position.longitude)
        //        print(position.)
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: position.latitude, longitude: position.longitude)
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            if let placeArray = placemarks as [CLPlacemark]! {
                var placeMark: CLPlacemark!
                placeMark = placeArray[0]
                let address = placeMark.addressDictionary!["FormattedAddressLines"] as! Array<String>
                let presentAddress = address.joined(separator: ", ")
                print(presentAddress)
                self.addressLbl.text = "Location  : " + presentAddress
                let defaults = UserDefaults.standard
                defaults.set(presentAddress, forKey: "presentAddress")
                defaults.set(self.position.latitude, forKey: "latitude")
                defaults.set(self.position.longitude, forKey: "longitude")
                
                                self.update_address = presentAddress
                //
                //                let headers: HTTPHeaders = [
                //                    "Token": self.token
                //                ]
                //                Alamofire.request(Config.url("/agent/set_agent_location"), method: .post, parameters:["location_latitude":self.position.latitude, "location_longitude": self.position.longitude, "address": presentAddress ], headers:headers)
                //                    .responseJSON { response in
                //                        if response.result.isSuccess {
                //
                //                            let json: JSON = JSON(response.result.value!)
                //                            print(json)
                //                        } else {
                //                            print("error")
                //
                //                        }
                //
                //                }
                //                self.searchButton.setTitle(presentAddress, for: .normal)
            }
        }
    }
    @IBAction func doSetLocationAct(_ sender: Any) {
        let defaults = UserDefaults.standard
        print(update_address)
        defaults.set(update_address, forKey: "presentAddress")
        defaults.set(self.position.latitude, forKey: "latitude")
        defaults.set(self.position.longitude, forKey: "longitude")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
//        _ = navigationController?.popViewController(animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
