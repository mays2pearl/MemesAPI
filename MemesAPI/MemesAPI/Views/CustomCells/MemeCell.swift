//
//  MemeCell.swift
//  MemesAPI
//
//  Created by Maysa on 30/09/21.
//

import UIKit

class MemeCell: UITableViewCell {

    @IBOutlet weak var nameMeme: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(value: MemeModel ) {
       
        self.nameMeme.text = value.name
    }
}
