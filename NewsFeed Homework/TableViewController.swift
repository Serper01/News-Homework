//
//  TableViewController.swift
//  NewsFeed Homework
//
//  Created by Serper Kurmanbek on 22.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = [News(name:"В Алматы открылся самый большой в Центральной Азии зал IMAX® в молле Aport East...", image:"Новость1"),
                 News(name: "Новый год без ущерба для кошелька и психики. Что говорят экономисты и психологи..", image: "НГ"),
                 News(name: "В Алматы прошел VI чемпионат Центральной Азии по кендо...",image: "Новость3"),
                 News(name: "Токаев подписал закон о спецвыплатах...",image: "Новость4")]
    
    var time = 0
    var timer = Timer()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = array[indexPath.row].name
        let imageView = cell.viewWithTag(1001) as! UIImageView
        imageView.image = UIImage(named: array[indexPath.row].image)
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let formatedDate = dateFormatter.string(from: todayDate)
        let dateLabel = cell.viewWithTag(1003) as! UILabel
        dateLabel.text = String(formatedDate)
        

        return cell
    }
    
    @objc func startTimer() {
        array.insert(array[3], at: 0)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 284
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
