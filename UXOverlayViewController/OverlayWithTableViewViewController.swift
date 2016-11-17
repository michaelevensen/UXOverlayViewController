//
//  OverlayWithTableViewViewController.swift
//  UXOverlayViewController
//
//  Created by Michael Nino Evensen on 08/07/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class OverlayWithTableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rounded corners
        self.contentView.layer.cornerRadius = 10
    }
    
    // MARK: - Scrollview
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
        if(scrollView == self.tableView) {
            // its your tableView
            print("scrolling tableview scrollview \(scrollView)")
        }
//        else if(scrollView == self.scrollView) {
//            // its your scrollView
//            print("scrolling scrollview \(scrollView)")
//        }

        else {
            let snapThreshold: CGFloat = 80
            let contentOffsetY = scrollView.contentOffset.y
            
            print(abs(contentOffsetY))
            
            // snap back to view controller
            if abs(contentOffsetY) > snapThreshold {
//                self.navigationController?.popViewControllerAnimated(true)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }

}
