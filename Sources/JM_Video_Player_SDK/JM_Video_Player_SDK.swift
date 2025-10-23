// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  JMVideoPlayerSDK.swift
//  JMVideoPlayerSDK
//
//  Created by JM_Reddy on 23/10/25.
//

import AVFoundation
import AVKit
#if canImport(UIKit)
import UIKit


public class JMVideoPlayerView:NSObject,JMVideoPlayerProtocol {
    private var playerViewController = AVPlayerViewController()
    private let avplayer = AVPlayer()
    
    public var isVideoStrated:((Bool) ->(Void))?
    
    public override init() {
        super.init()
        playerViewController.player = avplayer
        playerViewController.showsPlaybackControls = false
        self.addObserverForPlayer()
    }
    deinit {
        avplayer.removeObserver(self, forKeyPath: "timeControlStatus")
    }
    
    public var playerRate: Float {
        return avplayer.rate
    }
    
    
    
    private lazy var playerView: UIView = {
        guard let view = playerViewController.view else { return UIView() }
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func addObserverForPlayer()  {
        avplayer.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        
    }
    
    public override func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus" {
            if avplayer.timeControlStatus == .playing {
                print("🎬 Video actually started playing")
                isVideoStrated?(true)
            } else if avplayer.timeControlStatus == .paused {
                print("⏸️ Video paused")
                isVideoStrated?(false)
            }
        }
    }
    public func startVideo(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        avplayer.replaceCurrentItem(with: playerItem)
        avplayer.play()
    }
    
    public func playPauseVideo() {
        if avplayer.rate == 0 {
            avplayer.play()
        }else {
            avplayer.pause()
        }
    }
    
    public func stopVideo() {
        avplayer.rate = 0
        avplayer.seek(to: .zero)
        avplayer.pause()
    }
    
    
    public func addToView(to view: UIView){
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

#endif



