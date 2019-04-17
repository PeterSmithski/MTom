//
//  SearchDevicesViewController.swift
//  MTom
//
//  Created by Peter Kowalski on 15/04/2019.
//  Copyright © 2019 Peter Kowalski. All rights reserved.
//

import UIKit
import CoreBluetooth

class SearchDevicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BluetoothSerialDelegate {
    
    
    @IBOutlet weak var devicesTableView: UITableView!
    
    
    var peripherals: [(peripheral: CBPeripheral, RSSI: Float)] = []
    var selectedPeripheral: CBPeripheral?
    var receivedBytes: [UInt8] = []
    
    override func viewDidLoad() {
        serial = BluetoothSerial(delegate: self)
        super.viewDidLoad()
        
        devicesTableView.delegate = self
        devicesTableView.dataSource = self
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        performSegue(withIdentifier: "goToPanel", sender: self)
        //dismiss(animated: true, completion: nil)
    }
    
    //MARK: Table View configuration
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Found devices"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = devicesTableView.dequeueReusableCell(withIdentifier: "BTCell", for: indexPath)
        
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        
        cell.textLabel?.text = peripherals[indexPath.row].peripheral.name ?? "Devices not found"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        devicesTableView.deselectRow(at: indexPath, animated: true)
        serial.stopScan()
        serial.connectToPeripheral(peripherals[indexPath.row].peripheral)
    }
    
    //MARK: Bluetooth LE
    func serialDidChangeState() {
        if serial.centralManager.state != .poweredOn{
            messageBox(title: "Bluetooth is off", message: "Please turn on bluetooth", btText: "Ok", goToSettings: true)
        }
        else{
            serial.startScan()
        }
    }
    
    func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?) {
        
        for existing in peripherals{
            if existing.peripheral.identifier == peripheral.identifier { return }
        }
        
        let theRSSI = RSSI?.floatValue ?? 0.0
        peripherals.append((peripheral: peripheral, RSSI: theRSSI))
        peripherals.sort {$0.RSSI < $1.RSSI}
        devicesTableView.reloadData()
    }
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
        messageBox(title: "Disconnected", message: "Device has been disconnected", btText: "Ok")
    }
}

