//
//  ViewController.swift
//  SpringAnim
//
//  Created by Константин Натаров on 03.05.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    @IBOutlet private weak var animationView: SpringView!
    
    @IBOutlet weak var startAnimationButton: UIButton!
    
    @IBOutlet private weak var presetLabel: UILabel!
    @IBOutlet private weak var curveLabel: UILabel!
    @IBOutlet private weak var forceLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var delayLabel: UILabel!
    
    private var randomAnimation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimationButton.layer.cornerRadius = 10
        setupUI()
    }
    
    @IBAction func startAnimationBtnTapped() {
        animate(view: animationView, withAnimation: randomAnimation)
    }
}

private extension MainViewController {
    func setupUI() {
        presetLabel.text = randomAnimation.name
        curveLabel.text = randomAnimation.curve
        forceLabel.text = randomAnimation.force.formatted()
        durationLabel.text = randomAnimation.duration.formatted()
        delayLabel.text = randomAnimation.delay.formatted()
    }
}
private extension MainViewController {
    func animate(view: SpringView, withAnimation animation: Animation) {
        view.animation = animation.name
        view.curve = animation.curve
        view.force = animation.force
        view.duration = animation.duration
        view.delay = animation.delay
        view.animateNext { [unowned self] in
            setupUI()
            randomAnimation = Animation.getRandomAnimation()
            startAnimationButton.setTitle("Start \(randomAnimation.name)", for: .normal)
        }
    }
}
