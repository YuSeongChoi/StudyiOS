//
//  DetailViewController.swift
//  BountyList
//
//  Created by Mac on 2020/07/30.
//  Copyright © 2020 com.yuseong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM Model
    
    // Model
    // - BountyInfo
    // -> BountyInfo 만들자
    
    // View
    // - imgView, nameLabel, bountyLabel
    // -> view들은 viewModel을 통해서 구성되기
    
    // ViewModel
    // - DetailViewModel을 만든다.
    // -> 뷰 레이어에서 필요한 레이어 만들기
    // -> 모델 가지고 있기, BountyInfo 들
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


class DetailViewModel {
     var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
