//
//  EpisodeTableViewCell.swift
//  PastelFamily
//
//  Created by bs on 2015/12/06.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class EpisodeListTableViewCell: UITableViewCell {

  @IBOutlet weak fileprivate var episodeImage: UIImageView!
  @IBOutlet weak fileprivate var episodeTitle: UILabel!
  @IBOutlet weak fileprivate var favoriteLabel: UILabel!

  var episode: EpisodeEntity? {

    didSet {

      guard let episode = episode else {
        return
      }

      episodeTitle.text = episode.title
      
      if let isReadFlag = episode.isReadFlag.value {
        if isReadFlag {
          episodeTitle.textColor = UIColor.gray
        } else {
          episodeTitle.textColor = UIColor.black
        }
      }

      if let isFavoriteFlag = episode.isFavoriteFlag.value {
        favoriteLabel.isHidden = !isFavoriteFlag
      }
      episodeImage.sd_setImage(with: URL(string: episode.imageUrl!))

    }
  }

  static let cellIdentifier = "EpisodeListTableViewCell"

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
