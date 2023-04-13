//
//  ViewController.swift
//  ToDoListUIKit
//
//  Created by Maciej on 13/04/2023.
//

import UIKit

final class TasksViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var ongoingContainerView: UIView!
    @IBOutlet private weak var doneContainerView: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
    }
    
    // MARK: - Actions
    @IBAction private func segmentedControlChanged(_ sender: UISegmentedControl) {
        showContainerView(for: sender.selectedSegmentIndex)
    }
    
    @IBAction private func addTaskButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showAddNewTask", sender: nil)
    }
}

// MARK: - Private Helpers
private extension TasksViewController {
    func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        MenuSection.allCases.enumerated().forEach { index, section in
            segmentedControl.insertSegment(withTitle: section.name, at: index, animated: false)
        }
        
        let defaultIndex = 0
        
        segmentedControl.selectedSegmentIndex = defaultIndex
        showContainerView(for: defaultIndex)
    }
    
    func showContainerView(for segmentIndex: Int) {
        guard let newSection = MenuSection(rawValue: segmentIndex) else {
            fatalError("Invalid segmented range")
        }
        
        ongoingContainerView.isHidden = !(newSection == .ongoing)
        doneContainerView.isHidden = !(newSection == .done)
    }
}
