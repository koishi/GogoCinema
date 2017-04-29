//
//  ComicViewController.swift
//  PastelFamily
//
//  Created by bs on 2015/12/05.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit
import WebKit

final class EpisodeDetailViewController: UIViewController {

  fileprivate var webView: WKWebView!
  var htmlString: String?
  var episode: EpisodeEntity?
  var episodeIndex: Int?

  static let identifier = "EpisodeDetailViewController"

  @IBOutlet weak var subView: UIView!
  @IBOutlet weak var nextEpisodeButton: UIButton!
  @IBOutlet weak var favoriteButton: UIButton!

  // MARK: - LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()

    webView = WKWebView()
    setupSubViews()

    if let htmlString = htmlString {
      webView.loadHTMLString(htmlString, baseURL: nil)
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    webView.scrollView.delegate = nil;
  }

  fileprivate func setupSubViews() {
    webView.navigationDelegate = self
    webView.scrollView.delegate = self
    webView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(webView)
    view.sendSubview(toBack: webView)
    var viewBindingsDict = [String: AnyObject]()
    viewBindingsDict["webView"] = webView
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))

    subView.isHidden = true
  }

  // MARK: IBAction
  
  @IBAction func tappedNextEpisodeButton(_ sender: AnyObject) {
    if let html = GogoItemManager.sharedInstance.nextEpisodeHtml(episodeIndex!) {
      htmlString = html
      episodeIndex! += 1
      episode = GogoItemManager.sharedInstance.episodes[episodeIndex!]
      webView.loadHTMLString(htmlString!, baseURL: nil)
    }
  }

  @IBAction func tappedFavoriteButton(_ sender: AnyObject) {
    episode?.isFavorite()
  }

}

// MARK: - WKNavigationDelegate

extension EpisodeDetailViewController: WKNavigationDelegate {

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    navigationItem.title = webView.title
  }

}

// MARK: - UIScrollViewDelegate

extension EpisodeDetailViewController: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if webView.scrollView.bounds.size.height == 0 || webView.scrollView.contentSize.height == 0 {
      subView.isHidden = true
      return
    }
    
    let calc = (webView.scrollView.contentOffset.y + webView.scrollView.bounds.size.height) / webView.scrollView.contentSize.height
    if calc >= 1.0 {
      episode?.isRead()
      subView.isHidden = false
      
      if GogoItemManager.sharedInstance.availableEpisode(episodeIndex! + 1) {
        nextEpisodeButton.isHidden = false
      } else {
        nextEpisodeButton.isHidden = true
      }
      
      return
    }
    
    subView.isHidden = true
    return
  }

}
