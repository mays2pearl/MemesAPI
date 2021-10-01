//
//  ViewController.swift
//  MemesAPI
//
//  Created by Maysa on 30/09/21.
//

import UIKit

class ViewController: UIViewController {

    private var vController = MemeTableView()

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(UINib(nibName: "MemeCell", bundle: nil), forCellReuseIdentifier: "MemeCell")
        self.vController.webRequest {
            self.myTableView.reloadData()
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detalhesVC: DetailsViewController? = segue.destination as? DetailsViewController
        detalhesVC?.selectedMeme = sender as? MemeModel
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vController.counter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MemeCell? = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath) as? MemeCell
        
        cell?.nameMeme?.text = self.vController.currentMeme(index: indexPath.row).name
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsViewController", sender: self.vController.currentMeme(index:indexPath.row))
        
    }
    
    
}
