//
//  TravelTableViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/26/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let magazineList = MagazineInfo().magazine
    let identifier = TravelTableViewCell.identifier

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("여행을 떠나요🏝️")
        tableView.rowHeight = 500
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TravelTableViewCell
        let magazine = magazineList[indexPath.row]
        
        cell.configureCellUI()
        cell.configureCellData(data: magazine)
        
        return cell
    }
}
