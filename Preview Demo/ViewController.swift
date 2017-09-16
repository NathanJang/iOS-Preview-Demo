//
//  ViewController.swift
//  Preview Demo
//
//  Created by Jonathan Chan on 2017-09-16.
//  Copyright © 2017 Jonathan Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        registerForPreviewing(with: self, sourceView: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") else { return nil }
        let navigationController = UINavigationController(rootViewController: detailViewController)
        return navigationController
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        guard let detailViewController = (viewControllerToCommit as? UINavigationController)?.visibleViewController else { return }
        navigationController?.pushViewController(detailViewController, animated: false)
    }
}
