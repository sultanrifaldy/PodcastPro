//
//  HomeViewController.swift
//  PodcastPro
//
//  Created by Sultan Rifaldy on 23/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    

    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}


extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recent_cell", for: indexPath) as! HomeViewCell
        
        cell.numberLabel.text = String(format: "%02d", indexPath.row + 1)
        cell.titleLabel.text = "Row \(indexPath.row + 1)"
        cell.subtitleLabel.text = "Detail Row \(indexPath.row + 1)"
        cell.thumbImageView.image = UIImage(named: "diamond")
        
        cell.delegate = self
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Row Selected", message: "Row\(indexPath.row + 1) selected", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default, handler: { (alertaction) in
            print("Cell at \(indexPath.row + 1) is selected")
            tableView.deselectRow(at: indexPath, animated: true)
        }))
        present(alert, animated: true)
    }
}


extension HomeViewController: HomeViewCellDelegate {
    func HomeViewCellDelegateMoreButtonTapped(cell: HomeViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let actionSheet = UIAlertController(title: "More at row \(indexPath.row + 1)", message: "Select action below", preferredStyle: UIAlertController.Style.actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                print("Button at \(indexPath.row + 1) tapped")
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(actionSheet, animated: true)
        }
    }
}
