//
//  ViewController.swift
//  pitch-perfect
//
//  Created by Helder M Adversi Jr on 23/07/21.
//

import UIKit

class RecordAudioViewController: UIViewController {
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }

    // MARK: - Button actions
    @IBAction func startRecording(_ sender: Any) {
        setUpButtons(isRecording: true)
    }

    @IBAction func stopRecording(_ sender: Any) {
        setUpButtons(isRecording: false)
        performSegue(withIdentifier: "fromRecordAudioToPlayAudio", sender: nil)
    }

    // MARK: - Private functions
    private func setUpButtons(isRecording: Bool = false) {
        recordButton.isEnabled = !isRecording
        stopRecordingButton.isEnabled = isRecording
        recordLabel.text = isRecording ? "Recording..." : "Tap to record"
    }
}

