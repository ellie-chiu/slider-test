//
//  ViewController.swift
//  slider test
//
//  Created by TINA on 2020/12/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var wolf: UIImageView!
    @IBOutlet weak var sheep: UIImageView!
    @IBOutlet weak var nightshow: UIImageView!
    @IBOutlet weak var bigmoon: UIImageView!
    
    func updatelocation (degrees: CGFloat){
        bigmoon.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degrees).translatedBy(x: 0, y: 334)
    }
    
    @IBAction func moveslider(_ sender: UISlider) {
        let sheepspeed = sender.value*0.2
        let wolfspeed = sender.value*0.7
        wolf.frame.origin.x=CGFloat(607-wolfspeed)
        sheep.frame.origin.x=CGFloat(328-sheepspeed)
        nightshow.alpha = CGFloat(sender.value/600)
        
        //moon move
        updatelocation(degrees: CGFloat(sender.value/4)+500)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set grandientlayer
        let backgroundlayer = CAGradientLayer()
        backgroundlayer.frame = view.bounds
        backgroundlayer.colors = [
            UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1).cgColor,
            UIColor(red: 109/255, green: 213/255, blue: 250/255, alpha: 1).cgColor,
        ]
        view.layer.insertSublayer(backgroundlayer, at: 0)
        
        //set amimatedimage
        let imageview = UIImageView(frame: CGRect(x: 0, y: 320, width: 890, height: 100))
        view.addSubview(imageview)
        
        let animatedimage = UIImage.animatedImageNamed("5733bf3612a74d38e2aac8274752d5866sILhOtr9ZQHrXI3-", duration: 2)
        imageview.image = animatedimage
        
        updatelocation(degrees: 60)
    }
    
}

