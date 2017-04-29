//
//  EpisodeEntity.swift
//  PastelFamily
//
//  Created by bs on 2015/12/05.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import SDWebImage
import RealmSwift

class EpisodeEntity: Object {
  dynamic var title: String?
  dynamic var url: String?
  dynamic var imageUrl: String?
  var komaUrl = List<Koma>()
  let isNewFlag = RealmOptional<Bool>(false)
  let isReadFlag = RealmOptional<Bool>(false)
  let isFavoriteFlag = RealmOptional<Bool>(false)

  convenience init(title: String, url: String, imageUrl: String) {
    self.init()
    self.title = title
    self.url = url
    self.imageUrl = imageUrl
    self.komaUrl = List<Koma>()
    self.isNewFlag.value = false
    self.isReadFlag.value = false
    self.isFavoriteFlag.value = false
  }

  func isRead() {
    let realm = try! Realm()
    try! realm.write {
      isReadFlag.value = true
    }
  }

  func isFavorite() {
    let realm = try! Realm()
    try! realm.write {
      if isFavoriteFlag.value == true {
        isFavoriteFlag.value = false
        return
      }
      isFavoriteFlag.value = true
    }
  }

}

class Koma: Object {
  dynamic var url: String?

  convenience init(url: String)
  {
    self.init()
    self.url = url
  }
}