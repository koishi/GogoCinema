//
//  GogoItemEntity.swift
//  PastelFamily
//
//  Created by 大石　弘一郎 on 2016/07/25.
//  Copyright © 2016年 bs. All rights reserved.
//

import Foundation
import RealmSwift

class GogoItemEntity: Object {

    // 放送日
    dynamic var date: String?

    // 地上波初放送ラベル
//    var isFirstTerrestria = RealmOptional<Bool>(false)
    dynamic var redText: String?
    
    // 特集テーマ
    dynamic var specialTheme: String?
    
    // 邦題
    dynamic var japaneseTitle: String?
    
    // 原題
    dynamic var englishTitle: String?
    
    // 公開年
    dynamic var year: String?
    
    // 製作国
    dynamic var country: String?
    
    // 画像URL
    dynamic var imageDataString: String?
    
    var detailEntities = List<GogoItemDetailEntity>()

    dynamic var url: String?

    //            http://www.tv-tokyo.co.jp/telecine/oa_afr_load/backnumber/201607/20160704.jpg
    //
    //            <div class="gogo_item" data-oastart="2016070113500000" data-oaend="2016070115550000">
    //            <span class="g_img"><img src="/telecine/oa_afr_load/images/photo_now_printing.jpg" data-original="/telecine/oa_afr_load/backnumber/201607/20160701.jpg"></span>
    //            <span class="g_day roboto"><span class="g_hide">7/</span>1<span class="g_hide small">[金]</span></span>
    //            <span class="g_red"><!-- 地上波初 --></span>
    //            <div class="g_data_block">
    //            <span class="g_sp_thema"></span>
    //            <h3>
    //            <span class="jp">ドライブ・アングリー</span><span class="en roboto">DRIVE ANGRY</span>
    //            </h3>
    //            <div class="other_data g_hide">
    //            <span class="g_country_year">2011<span class="dot">◆</span>アメリカ</span>
    //            <div class="g_other_data">
    //            <div class="g_t">
    //            <span class="g_c"><span class="data_title">監督</span></span>
    //            <span class="g_c">パトリック・ルシエ</span>
    //            </div>
    //            <div class="g_t">
    //            <span class="g_c"><span class="data_title">出演</span></span>
    //            <span class="g_c">ニコラス・ケイジ／アンバー・ハード</span>
    //            </div>
    //            </div>
    //            </div>
    //            </div>
    //            <div class="gogo_share">★<span class="roboto">SHARE</span>
    //            </div>
    //            <div class="gogo_share_window">
    //            <div class="googo_share_title"></div>
    //            <div class="gogo_social_bar"></div>
    //            <a href="#close" class="close">×</a>
    //            </div>
    //            </div>

    func siteURL() -> String? {
        guard let date = self.date else {
            return nil
        }
        return "http://www.tv-tokyo.co.jp/telecine/oa_afr_load/?trgt=" + date
    }

    func imageURL() -> String? {
        guard let imageDataString = self.imageDataString else {
            return nil
        }
        return "http://www.tv-tokyo.co.jp" + imageDataString
    }
    
}

class GogoItemDetailEntity: Object {
    // 詳細情報タイトル
    dynamic var title: String?
}


