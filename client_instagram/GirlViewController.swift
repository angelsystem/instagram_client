//
//  GirlViewController.swift
//  client_instagram
//
//  Created by angelito on 10/31/15.
//  Copyright © 2015 Angelito. All rights reserved.
//

import UIKit
import Alamofire

let accessToken = "189507668.4008e9b.37b99681d11a44adaee30101e7cd9a52"

class GirlViewController: UIViewController, UITableViewDataSource {
    
    var results:[JSON]? = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPets()

        // Do any additional setup after loading the view.
    }
    
    func loadPets(){
        let url = "https://api.instagram.com/v1/tags/pets/media/recent?access_token=\(accessToken)"
        Alamofire.request(.GET, url).responseJSON { response in
            var jsonObj = JSON(response.result.value!)
            if let data = jsonObj["data"].arrayValue as [JSON]? {
                self.results = data
                self.tableView.reloadData()
            }            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("girlCell", forIndexPath: indexPath) as! GirlTableViewCell
        cell.girl = self.results?[indexPath.row]
        return cell
    }

}

