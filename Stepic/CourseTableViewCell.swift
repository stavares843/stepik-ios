 //
//  CourseTableViewCell.swift
//  Stepic
//
//  Created by Alexander Karpov on 15.09.15.
//  Copyright (c) 2015 Alex Karpov. All rights reserved.
//

import UIKit
import SDWebImage
 
class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    @IBOutlet weak var deadlinesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func getTextFromDates(course: Course) -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeZone = .None
        
        
        if course.beginDate == nil && course.endDate == nil {
            return ""
        }
        
        if course.beginDate == nil && course.endDate != nil {
            return "до \(formatter.stringFromDate(course.endDate!))"
        }
        
        if course.beginDate != nil && course.endDate == nil {
            return "с \(formatter.stringFromDate(course.beginDate!))"
        }
        
        return "\(formatter.stringFromDate(course.beginDate!)) - \(formatter.stringFromDate(course.endDate!))"
    }
    
    func initWithCourse(course: Course) {
        courseNameLabel.text = course.title
        
        courseDescriptionLabel.setTextWithHTMLString(course.summary)
    
        deadlinesLabel.text = getTextFromDates(course)
        
        
        courseImageView.sd_setImageWithURL(NSURL(string: course.coverURLString)!, placeholderImage: Constants.placeholderImage)
        
    }
}
