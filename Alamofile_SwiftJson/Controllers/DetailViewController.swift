//
//  DetailViewController.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 09/12/2022.
//

//
//  DetailViewController.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import UIKit
import AVFoundation
import Kingfisher

class DetailViewController: UIViewController {

    var detailData: Result?
    init(detailData: Result? = nil) {
        self.detailData = detailData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    @IBOutlet weak var sliderMusic: UISlider!
    
    @IBOutlet weak var lbEnd: UILabel!
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbSinger: UILabel!
    
    @IBOutlet weak var slideVolume: UISlider!
    
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didBack))
        
        let url = URL(string: (detailData?.artworkUrl100)!)
        avatarImg.kf.setImage(with: url)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        playerInit()
 
    }
    
    @objc func didBack() {
        player?.pause()
        navigationController?.popViewController(animated: true)
    }
    
    func playerInit() {
        let url = URL(string: (detailData?.previewUrl)!)
        player = AVPlayer(url: url!)
        guard let duration = player?.currentItem?.asset.duration else {
                       return
    }
        let durationBySecond = CMTimeGetSeconds(duration)
        let min = Int(durationBySecond) / 60
        let second = Int(durationBySecond) % 60
        self.lbEnd.text = "\(min):\(second)"
        self.sliderMusic.maximumValue = Float(durationBySecond)
  
    }
    
    @objc func updateSlider() {
        if player != nil {
            let currentTimeBySecond = CMTimeGetSeconds((player!.currentTime()))
            sliderMusic.value = Float(currentTimeBySecond)
        }
    }
    
    @IBAction func onClickBtnPlay(_ sender: UIButton) {
       
        sender.isSelected = !sender.isSelected
        

            if sender.isSelected == true {
                sender.setImage(UIImage(named: "pause"), for: .normal)
                player?.play()
            }else {
                sender.setImage(UIImage(named: "icon_play"), for: .normal)
                    player?.pause()
                
                }
              
            }
            
    @IBAction func onClickBtnBackTime(_ sender: Any) {
        let currentTime = sliderMusic.value
                var targetTime : Float = 0
                if currentTime - 10 > 0 {
                    targetTime = currentTime - 10
                } else {
                 targetTime = 0
                }
                
                sliderMusic.value = targetTime
                if player != nil {
                    player?.seek(to: CMTime(seconds: Double(targetTime), preferredTimescale: 1))
                }
    }
    
    @IBAction func onClickNextTime(_ sender: Any) {
        let currentTime = sliderMusic.value
               var targetTime : Float = 0
               if currentTime + 10 > sliderMusic.maximumValue {
                   targetTime = sliderMusic.maximumValue
               } else {
                   targetTime = currentTime + 10
               }
               
               sliderMusic.value = targetTime
               if player != nil {
                   player?.seek(to: CMTime(seconds: Double(targetTime), preferredTimescale: 1))
               }
    }
    
    @IBAction func onChangeVolume(_ sender: Any) {
        
        if player != nil {
                   player?.volume = slideVolume.value
               }
    }
}
