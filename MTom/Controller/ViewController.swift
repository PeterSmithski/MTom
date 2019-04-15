//
//  ViewController.swift
//  MTom
//
//  Created by Peter Kowalski on 11/03/2019.
//  Copyright © 2019 Peter Kowalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var volumeSlider: CustomizableSlider!
    @IBOutlet weak var balanceSlider: CustomizableSlider!
    
    var receivedVolume: Int = 50
    var receivedBalance: Int = 110
    var balancePosition: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func volumeDown(_ sender: Any) {
        if(volumeSlider.value > 0){
            volumeSlider.value = volumeSlider.value - 1
        }
        
    }
    
    @IBAction func volumeUp(_ sender: Any) {
        if(volumeSlider.value < 100){
            volumeSlider.value = volumeSlider.value + 1
        }
    }
    
    @IBAction func balanceLeft(_ sender: Any) {
        if(balancePosition > 0){balancePosition -= 1}
        scaleBalancePosition(currentBalance: balancePosition)
    }
    
    @IBAction func balanceRight(_ sender: Any) {
        if(balancePosition < 22){balancePosition += 1}
        scaleBalancePosition(currentBalance: balancePosition)
    }
    
    
    @IBAction func togglePower(_ sender: Any) {
    }
    
    @IBAction func toggleMute(_ sender: Any) {
    }
    
    @IBAction func disconnectPressed(_ sender: Any) {
    }
    
    @IBAction func connectPressed(_ sender: Any) {
    }
    
    
    //Because the provided background image is not symetrical, i have to empirically provide values on exact position
    func scaleBalancePosition(currentBalance: Int){
        switch currentBalance{
        case 0:
            balanceSlider.value = 0
        case 1:
            balanceSlider.value = 10
        case 2:
            balanceSlider.value = 20
        case 3:
            balanceSlider.value = 30
        case 4:
            balanceSlider.value = 40
        case 5:
            balanceSlider.value = 50
        case 6:
            balanceSlider.value = 60
        case 7:
            balanceSlider.value = 70
        case 8:
            balanceSlider.value = 80
        case 9:
            balanceSlider.value = 90
        case 10:
            balanceSlider.value = 100
        case 11:
            balanceSlider.value = 110
        case 12:
            balanceSlider.value = 120
        case 13:
            balanceSlider.value = 130
        case 14:
            balanceSlider.value = 140
        case 15:
            balanceSlider.value = 150
        case 16:
            balanceSlider.value = 160
        case 17:
            balanceSlider.value = 170
        case 18:
            balanceSlider.value = 180
        case 19:
            balanceSlider.value = 190
        case 20:
            balanceSlider.value = 200
        case 21:
            balanceSlider.value = 210
        case 22:
            balanceSlider.value = 220

        default:
            balanceSlider.value = 50
        }
    }
}

