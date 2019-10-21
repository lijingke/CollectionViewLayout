//
//  ViewController.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/10/10.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        navigationItem.title = "UICollectionTest"
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
    }
    
    let dataSource: [[String]] = [["基础布局篇", "布局和代理篇"], ["卡片布局", "瀑布流布局", "可伸缩Header", "标签布局"], ["滚动视图"]]
    
    let headViewTitles = ["BASICS", "CUSTOM LAYOUT", "UIScrollView"]
    
    fileprivate func configureUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = UITableViewHeaderFooterView()
        head.textLabel?.text = headViewTitles[section]
        return head
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = dataSource[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let vc = BasicViewController()
                DispatchQueue.main.async {[weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            case 1:
                let vc = LayoutAndDelegateViewController()
                DispatchQueue.main.async {[weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            default:
                break
            }

        }else if indexPath.section == 1 {
            
            switch indexPath.row {
            case 0:
                let vc = CardLayoutViewController()
                DispatchQueue.main.async {[weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            case 1:
                let vc = WaterFallsViewController()
                DispatchQueue.main.async {[weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            case 2:
                let vc = StretchyHeaderViewController()
                DispatchQueue.main.async {[weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            case 3:
                
                let vc = TagViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                let vc = ScrollViewController()
                vc.navigationItem.title = "ScrollView"
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.section][indexPath.row]
        return cell
    }
    
    
}

