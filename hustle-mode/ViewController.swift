//
//  ViewController.swift
//  hustle-mode
//
//  Created by Gregory on 5/22/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var roket: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var husteLbl: UILabel!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var powerBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.roket.frame = CGRect(x: 0, y: -200, width: 450, height: 402)
        }) { (finished) in
            self.husteLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    

}

