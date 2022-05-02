//
//  HabitDetailsDataSource.swift
//  MyHabits
//
//  Created by Vadim on 23.04.2022.
//

import UIKit

class HabitDetailsDataSource: NSObject {
    
    var dates = [Date]()
    
    private func convertDateFormat(date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let date: String = dateFormatter.string(from: date)
        return date
    }
}

extension HabitDetailsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = convertDateFormat(date: dates[indexPath.row])
        cell.accessoryType = .checkmark
        cell.tintColor = .purpleColor
        return cell
    }
}
