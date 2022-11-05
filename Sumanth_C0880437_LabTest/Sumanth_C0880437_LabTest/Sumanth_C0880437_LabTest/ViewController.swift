//
//  ViewController.swift
//  Sumanth_C0880437_LabTest
//
//  Created by Sai Sumanth Nissankara rao on 2022-11-04.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var lapbtn: UIButton!
    @IBOutlet weak var timerlbl: UILabel!
    @IBOutlet weak var tabledata: UITableView!
    @IBOutlet weak var start: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var data:[Double] = []
    var running = false
    var reset = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerlbl.text = "\(counter)"
    }

    @IBAction func starttimer() {
        
        if !running{
            start.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            running = true
        }else if running{
            start.setTitle("Start", for: .normal)
            timer.invalidate()
            running = false
            //lapbtn.setTitle("Reset", for: .normal)
        }
    }
    @objc private func updateTimer(){
        counter = counter + 0.1
        timerlbl.text = String(format: "%.1f", counter)
    }
    
    
    @IBAction func lap() {
            var temp = Double(timerlbl.text!)
            data.append(temp!)
            tabledata.reloadData()
        
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    
}
