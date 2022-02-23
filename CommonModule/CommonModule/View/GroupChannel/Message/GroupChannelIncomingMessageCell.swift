//
//  GroupChannelIncomingMessageCell.swift
//  CommonModule
//
//  Created by Ernest Hong on 2022/02/23.
//

import UIKit
import SendBirdSDK
import Kingfisher

public class GroupChannelIncomingMessageCell: UITableViewCell, GroupChannelMessageCell {
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nicknameTextLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        nicknameTextLabel.text = nil
        profileImageView.kf.cancelDownloadTask()
        profileImageView.image = nil
        messageLabel.text = nil
    }

    public func configure(with message: SBDBaseMessage) {
        if let sender = message.sender {
            nicknameTextLabel.text = "\(sender.nickname ?? "(Unknown)")"
            profileImageView.setProfileImageView(for: sender)
        }
        
        messageLabel.text = message.message
    }
}
