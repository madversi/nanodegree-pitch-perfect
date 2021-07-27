//
//  ViewController.swift
//  pitch-perfect
//
//  Created by Helder M Adversi Jr on 23/07/21.
//

import AVFoundation
import UIKit

class RecordAudioViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    private var audioRecorder: AVAudioRecorder!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        setUpAudioRecorder()
    }

    // MARK: - Button actions
    @IBAction func didTapRecordButton(_ sender: Any) {
        setUpScreen(isRecording: true)
        startRecording()
    }

    @IBAction func didTapStopRecordingButton(_ sender: Any) {
        setUpScreen(isRecording: false)
        stopRecording()
    }

    // MARK: - Private functions
    private func setUpScreen(isRecording: Bool = false) {
        recordButton.isEnabled = !isRecording
        stopRecordingButton.isEnabled = isRecording
        recordLabel.text = isRecording ? "Recording..." : "Tap to record"
    }

    private func setUpAudioRecorder() {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
    }

    private func startRecording() {
        audioRecorder.record()
    }

    private func stopRecording() {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromRecordAudioToPlayAudio" {
            let destinationViewController = segue.destination as? PlayAudioViewController
            let recordedAudioURL = sender as? URL
            destinationViewController?.recordedAudioURL = recordedAudioURL
        }
    }
}
// MARK: - AVAudioRecorderDelegate
extension RecordAudioViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "fromRecordAudioToPlayAudio", sender: audioRecorder.url)
        }
    }
}
