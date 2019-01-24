//
//  PlaySoundViewController.swift
//  pitch perfect
//
//  Created by zico on 1/7/19.
//  Copyright © 2019 stanford Unversity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var snialButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : URL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    enum ButtonType : Int { case slow = 0 , fast , chipmuk , vader , echo , reverb}
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate : 0.5)
        case .fast:
            playSound(rate : 1.5)
        case .chipmuk:
            playSound(pitch : 1000)
        case .vader:
            playSound(pitch : -1000)
        case .echo :
            playSound(echo : true)
        case .reverb:
            playSound(reverb : true)
        }
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
