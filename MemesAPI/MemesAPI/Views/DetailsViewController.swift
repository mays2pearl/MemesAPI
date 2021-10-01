//
//  DetailsViewControllerViewController.swift
//  MemesAPI
//
//  Created by Maysa on 30/09/21.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
   
    var selectedMeme: MemeModel?
    
    @IBOutlet weak var imageMeme: UIImageView!
    
    @IBOutlet weak var labelMeme: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.imageMeme.sd_setImage(with: URL(string: selectedMeme?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.labelMeme.text = selectedMeme?.name
        
        self.imageMeme.layer.cornerRadius = 0.2 * self.imageMeme.bounds.size.width
        
        self.imageMeme.clipsToBounds = true
        self.imageMeme.layer.borderWidth = 10
    }
    


}
