//
//  ResultViewController.swift
//  Gacha
//
//  Created by Chiaki Wada on 2023/05/06.
//

import UIKit

class ResultViewController: UIViewController {

    //乱数を入れるためのInt型の変数を用意
    var number: Int!
    
    //背景画像とモンスターの画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var characterImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //0〜9までの乱数を発生させる
        number = Int.random(in: 0...9)
        if number == 9 {
            //激レアキャラクター
            characterImageView.image = UIImage(named: "IoTMesh")
            backgroundImageView.image = UIImage(named: "bgBlue")
        } else if number >= 7 {
            //レアキャラクター
            characterImageView.image = UIImage(named: "camera")
            backgroundImageView.image = UIImage(named: "bgGreen")
        } else {
            //ノーマルキャラクター
            characterImageView.image = UIImage(named: "iphone")
            backgroundImageView.image = UIImage(named: "bgRed")
        }
    }
    
    override func viewWillAppear(_ animated:Bool) {
        //キャラクター出現時のアニメーション
        self.characterImageView.center = self.view.center
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {
        self.characterImageView.center.y += 10.0
            }) { _ in
                self.characterImageView.center.y -= 10.0
            }
    }
        
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
