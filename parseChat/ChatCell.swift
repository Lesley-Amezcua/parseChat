//
//  ChatCell.swift
//  parseChat
//
//  Created by lesley amezcua on 3/7/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import Foundation
import UIKit
class ChatCell: UITableViewCell{
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.cornerRadius = 10
        messageView.clipsToBounds = true
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
