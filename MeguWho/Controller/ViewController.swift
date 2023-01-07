//
//  ViewController.swift
//  MeguWho
//
//  Created by Илья Валито on 28.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 100000
    let imageSet = ImageSet()
    var firstTap: Bool = true
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            imageView.image = imageSet.images.randomElement()?.value
        } else {
            timer.invalidate()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.06, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if firstTap {
            timer.invalidate()
            resultLabel.text = "Congratulations! You're:\n\(imageSet.images.filter{$1 == imageView.image}.keys.first ?? "Someone Else")"
        } else {
            secondsPassed = 0
            timer = Timer.scheduledTimer(timeInterval: 0.06, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
            resultLabel.text = "Tap to find out!"
        }
        firstTap = !firstTap
        
    }
}

