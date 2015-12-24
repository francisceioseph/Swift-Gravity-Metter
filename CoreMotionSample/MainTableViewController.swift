//
//  MainTableViewController.swift
//  CoreMotionSample
//
//  Created by Francisco José A. C. Souza on 24/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit
import CoreMotion

class MainTableViewController: UITableViewController {

    @IBOutlet weak var zAxisGravityTableViewCell: UITableViewCell!
    @IBOutlet weak var yAxisGravityTableViewCell: UITableViewCell!
    @IBOutlet weak var xAxisGravityTableViewCell: UITableViewCell!
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.deviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.5
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {
                (deviceMotion, error) -> Void in
                
                self.updateLabelsText(deviceMotion!)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateLabelsText(deviceMotion:CMDeviceMotion){
        self.xAxisGravityTableViewCell.detailTextLabel!.text = String(format: "%.4f", arguments: [deviceMotion.gravity.x])
        self.yAxisGravityTableViewCell.detailTextLabel!.text = String(format: "%.4f", arguments: [deviceMotion.gravity.y])
        self.zAxisGravityTableViewCell.detailTextLabel!.text = String(format: "%.4f", arguments: [deviceMotion.gravity.z])
    }

}
