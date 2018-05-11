//
//  DetailViewController.swift
//  TodoList
//
//  Created by user on 11.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var itemInfo: (ItemManager, Int)?
  
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    guard let itemInfo = itemInfo else { return }
    let item = itemInfo.0.item(at: itemInfo.1)
    
    titleLabel.text = item.title
    locationLabel.text = item.location?.name
    descriptionLabel.text = item.itemDescription
    
    if let timestamp = item.timestamp {
      let date = Date(timeIntervalSince1970: timestamp)
      dateLabel.text = dateFormatter.string(from: date)
    }
    
    if let coordinate = item.location?.coordinate {
      let region = MKCoordinateRegionMakeWithDistance(coordinate, 100, 100)
      mapView.region = region
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func checkItem() {
    if let infoItem = itemInfo {
      infoItem.0.checkItem(at: infoItem.1)
    }
  }
  
}
