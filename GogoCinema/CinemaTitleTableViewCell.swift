//
//  CinemaTitleTableViewCell.swift
//  GogoCinema
//
//  Created by bs on 2015/12/06.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit
import Kingfisher

class CinemaTitleTableViewCell: UITableViewCell {

    //  @IBOutlet weak fileprivate var image: UIImageView!
    //  @IBOutlet weak fileprivate var title: UILabel!
    //  @IBOutlet weak fileprivate var favorite: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var favorite: UILabel!
    @IBOutlet weak var date: UILabel!

    var gogoItem: GogoItemEntity? {

        didSet {

            guard let gogoItem = gogoItem else {
                return
            }

            title.text = gogoItem.japaneseTitle

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMddHHmmssSS"
            if let dateString = gogoItem.date, let date = formatter.date(from: dateString) {
                formatter.dateFormat = "M/d"
                self.date.text = formatter.string(from: date)
            }

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

            if let imageDataString = gogoItem.imageDataString {
                let url = URL(string: "http://www.tv-tokyo.co.jp" + imageDataString)
                thumbnail.kf.setImage(with: url)
            } else {
                thumbnail.image = nil
            }

        }
    }

    static let cellIdentifier = "CinemaTitleTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
