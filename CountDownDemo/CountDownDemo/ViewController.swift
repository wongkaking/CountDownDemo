import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    var count = 10
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = "获取验证码"
        countDownLabel.backgroundColor = .gray
        countDownLabel.isUserInteractionEnabled = true
//        countDownLabel.font = UIFont(name: "Helvetica", size: 26)
        countDownLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 26, weight: .regular)

        let tap = UITapGestureRecognizer(target: self, action: #selector(startTimer))
        countDownLabel.addGestureRecognizer(tap)
    }

    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timer.fire()
    }

    @objc func updateTime() {
        count = count - 1
        countDownLabel.text = "\(count)s"
        countDownLabel.isUserInteractionEnabled = false
        countDownLabel.backgroundColor = .lightGray

        if count == 0 {
            timer.invalidate()
            countDownLabel.text = "获取验证码"
            countDownLabel.isUserInteractionEnabled = true
            countDownLabel.backgroundColor = .gray
            count = 10
        }
    }
}

