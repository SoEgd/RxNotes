//
//  ViewController.swift
//  RxNotes
//
//  Created by Dennis Örnberg on 2018-02-25.
//  Copyright © 2018 Dennis Örnberg. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let items = Observable.just(["one", "two", "three"])

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) {
                row, element, cell in
                cell.textLabel?.text = "\(element)"
            }
            .disposed(by: disposeBag)
    }
}
