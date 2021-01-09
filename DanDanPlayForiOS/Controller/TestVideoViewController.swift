//
//  TestVideoViewController.swift
//  DanDanPlayForiOS
//
//  Created by JeffersonQin on 2021/1/9.
//

import UIKit

class TestVideoViewController: UIViewController {
    
    let thePlayer: VLCMediaPlayer =
    {
        let player = VLCMediaPlayer()
        return player
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let streamURL = URL(string: "http://192.168.31.140/test.mkv")!
        let media = VLCMedia.init(url: streamURL)
        thePlayer.media = media
        thePlayer.drawable = self.view
        thePlayer.play()
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
