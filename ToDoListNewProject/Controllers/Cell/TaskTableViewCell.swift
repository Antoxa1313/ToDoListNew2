//
//  TaskTableViewCell.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-16.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func didTapStatusButton( cell: TaskTableViewCell)
}


class TaskTableViewCell: UITableViewCell {

    var delegate: TaskTableViewCellDelegate?
    
    @IBOutlet weak var cellTitle: UITextField!
    
    @IBOutlet weak var cellDescription: UITextField!
    
    @IBOutlet weak var cellDeadline: UITextField!
    
    @IBOutlet weak var tappedStatusBarOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func tappedStatusBar(_ sender: UIButton) {
        delegate?.didTapStatusButton(cell: self)
    }
    
    
    
    
}
