//
//  PuraceSnackbarManager.swift
//  
//
//  Created by Juan Hurtado on 18/11/22.
//

import Foundation
import UIKit

public class PuraceSnackbarManager {
    private static var _instance: PuraceSnackbarManager? = nil
    public static var instance: PuraceSnackbarManager {
        if _instance == nil {
            _instance = PuraceSnackbarManager()
        }
        return _instance!
    }
    
    private var verbose = false
    
    var isPresented = false
    var queue = [() -> ()]()
    var snackbar: PuraceSnackbar?
    
    private init() {}
    
    private func setupSnackbarView(withTitle title: String, type: PuraceSnackbarType) {
        guard let window = UIApplication.shared.keyWindow else { return }
        let bottomPadding = window.safeAreaInsets.bottom
        
        snackbar = PuraceSnackbar(frame: .init(x: 0, y: 0, width: 100, height: 0))
        snackbar?.setup(with: title, type: type)
        window.addSubview(snackbar!)
        
        // Height constriant
        let heightConstraint = snackbar?.heightAnchor.constraint(equalToConstant: PuraceSnackbar.height)
        heightConstraint?.priority = .defaultLow
        heightConstraint?.isActive = true
        
        // Bottom constriant
        snackbar?.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: bottomPadding).isActive = true
        
        // Left constraint
        snackbar?.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: PuraceSnackbar.padding).isActive = true
        // Right constraint
        snackbar?.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -PuraceSnackbar.padding).isActive = true
    }
    
    
    /// When called this function, some verbose logs will be printed on the console.
    ///
    /// Call this function **only** for debug purpuses.
    public func debug() -> PuraceSnackbarManager {
        verbose = true
        return self
    }
    
    public func show(withTitle title: String, type: PuraceSnackbarType) {
        if isPresented {
            enqueue(label: "show") { [weak self] in
                guard let self else { return }
                self.show(withTitle: title, type: type)
            }
            return
        }
        
        if verbose {
            print("showing snackbar")
        }
        
        setupSnackbarView(withTitle: title, type: type)
        UIView.animate(withDuration: 0.4, delay: 0, animations: { [weak self] in
            guard let self else { return }
            self.snackbar?.transform = .init(translationX: 0, y: -PuraceSnackbar.height - PuraceSnackbar.padding)
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self else { return }
                if self.isPresented {
                    self.hide()
                }
            }
        }
        isPresented = true
        
    }
    
    public func hide() {
        if verbose {
            print("hiding snackbar")
        }
        guard isPresented else { return }
        UIView.animate(withDuration: 0.4, delay: 0, animations: { [weak self] in
            guard let self else { return }
            self.snackbar?.transform = .init(translationX: 0, y: PuraceSnackbar.height)
        }) { _ in
            self.snackbar?.removeFromSuperview()
            self.isPresented = false
            guard !self.queue.isEmpty else { return }
            let action = self.queue.removeFirst()
            action()
        }
    }
    
    private func enqueue(label: String, action: @escaping () -> ()) {
        queue.append(action)
        if verbose {
            print("Enqueuing action: \(label)")
            print("queue length: \(queue.count)")
        }
    }
}
