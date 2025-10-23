//
//  File.swift
//  JM_Video_Player_SDK
//
//  Created by JM_Reddy on 23/10/25.
//

import UIKit
@MainActor
public protocol JMVideoPlayerProtocol: AnyObject {
    var isVideoStrated: ((Bool) -> Void)? { get set }
    var playerRate: Float { get }
    func startVideo(url: URL)
    func playPauseVideo()
    func stopVideo()
    
    #if canImport(UIKit)
    func addToView(to view: UIView)
    #endif
}
