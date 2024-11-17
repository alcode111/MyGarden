//
//  HelperFunctions.swift
//  MyGarden
//
//  Created by Ismaïl on 17/11/2024.
//

import Foundation

class FormatDatesAndTime {
    static func formattedDateWithTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMMM 'at' HH:mm"
        return dateFormatter.string(from: date)
    }
}
