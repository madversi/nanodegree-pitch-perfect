//
//  PlayAudioViewController.swift
//  pitch-perfect
//
//  Created by Helder M Adversi Jr on 24/07/21.
//

import AVFoundation
import UIKit

class PlayAudioViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0,
             fast,
             chipmunk,
             vader,
             echo,
             reverb
    }

    @IBAction func playSoundFor(button: UIButton) {

    }

    @IBAction func didTapStopButton(_ sender: AnyObject) {
        
    }
}
