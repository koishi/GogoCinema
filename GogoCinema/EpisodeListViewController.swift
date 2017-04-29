//
//  EpisodeViewController.swift
//  PastelFamily
//
//  Created by bs on 2015/12/05.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
  @IBOutlet weak fileprivate var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = GogoItemManager.titleName

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: EpisodeListTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EpisodeListTableViewCell.cellIdentifier)

    GogoItemManager.sharedInstance.scrapingGogoitemList({
      self.tableView.reloadData()
    })
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

}

// MARK: - UITableDelegate

extension EpisodeListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: EpisodeDetailViewController.identifier) as! EpisodeDetailViewController
    vc.htmlString = GogoItemManager.sharedInstance.htmlString(indexPath.row)
    vc.episode = GogoItemManager.sharedInstance.episodes[indexPath.row]
    vc.episodeIndex = indexPath.row
    self.navigationController?.pushViewController(vc, animated: true)
  }

}

// MARK: - UITableViewDataSource

extension EpisodeListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeListTableViewCell.cellIdentifier) as! EpisodeListTableViewCell
    let episode = GogoItemManager.sharedInstance.episodes[indexPath.row]
    cell.episode = episode
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return GogoItemManager.sharedInstance.count()
  }

}
