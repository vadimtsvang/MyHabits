//
//  MakeHabitRouter.swift
//  MyHabits
//
//  Created by Vadim on 26.04.2022.
//

import UIKit

class MakeHabitRouter {
    
    var moduleViewController: MakeHabitViewController?
    
    func makeAlertController(title: String, removeHabitCompletion: @escaping VoidCompletion) {
        let alertController = UIAlertController(title: deleteHabit, message: "Вы хотите удалить привычку \n\(title)?", preferredStyle: .alert)
        let deleteAlertButton = UIAlertAction(title: delete, style: .default) { [weak self] _ in
            self?.moduleViewController?.dismiss(animated: true, completion: {
                removeHabitCompletion()
            })
        }
        
        let cancelAlertButton = UIAlertAction(title: cancelButton, style: .cancel)
        
        deleteAlertButton.setValue(UIColor.deleteButtonColor, forKey: "titleTextColor")
        
        alertController.addAction(deleteAlertButton)
        alertController.addAction(cancelAlertButton)
        moduleViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func makeColorPicker(selectedColor: UIColor?) {
        let picker = UIColorPickerViewController()
        picker.selectedColor = selectedColor ?? .black
        picker.delegate = moduleViewController
        moduleViewController?.present(picker, animated: true, completion: nil)
    }
    
    func dismissScreen() {
        moduleViewController?.dismiss(animated: true)
    }
}
