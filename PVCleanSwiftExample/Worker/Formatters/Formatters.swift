//
//  Formatters.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import Foundation

class Formatters {
    
    func dateFormatter(dateString: String) -> String {
        guard dateString != "" else { return ""}
        
        let originalFormatter = DateFormatter()
        originalFormatter.dateFormat = "yyyy-MM-dd"
        
        let finishFormatter = DateFormatter()
        finishFormatter.dateFormat = "yyyy"
        return finishFormatter.string(from: originalFormatter.date(from: dateString)!)
    }
    
    func minutesToHoursFormatter(dataMinutes: Int) -> String {
        let hours = dataMinutes / 60
        let minutes = dataMinutes % 60

        if minutes == 0 {
            let text = "\(hours)" + "ч "
            return text
        } else {
            let text = "\(hours)" + "ч " + "\(minutes)" + "мин"
            return text
        }
    }
    
}

