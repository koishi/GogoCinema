//
//  CinemaTitleTableViewCell.swift
//  GogoCinema
//
//  Created by bs on 2015/12/06.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class CinemaTitleTableViewCell: UITableViewCell {

//  @IBOutlet weak fileprivate var image: UIImageView!
//  @IBOutlet weak fileprivate var title: UILabel!
//  @IBOutlet weak fileprivate var favorite: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var favorite: UILabel!

  var gogoTitle: GogoItemEntity? {

    didSet {

      guard let gogoTitle = gogoTitle else {
        return
      }

      title.text = gogoTitle.japaneseTitle
      
//      if let isReadFlag = episode.isReadFlag.value {
//        if isReadFlag {
//          episodeTitle.textColor = UIColor.gray
//        } else {
//          episodeTitle.textColor = UIColor.black
//        }
//      }

//      if let isFavoriteFlag = episode.isFavoriteFlag.value {
//        favoriteLabel.isHidden = !isFavoriteFlag
//      }
      thumbnail.sd_setImage(with: URL(string: gogoTitle.imageDataString!))

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
