import UIKit

// AŞAMA 2 — sadece zincirin çalıştığını doğrulamak için minimal klavye.
// Aşama 3'te bu dosyanın tamamı gerçek klavye ile değiştirilecek.

class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        let title = UILabel()
        title.text = "AI Klavye çalışıyor 🎉"
        title.font = .systemFont(ofSize: 17, weight: .semibold)
        stack.addArrangedSubview(title)

        let insertBtn = makeButton("Metin ekle") { [weak self] in
            self?.textDocumentProxy.insertText("merhaba")
        }
        stack.addArrangedSubview(insertBtn)

        let globeBtn = makeButton("Klavye değiştir") { [weak self] in
            self?.advanceToNextInputMode()
        }
        stack.addArrangedSubview(globeBtn)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 260)
        ])
    }

    private func makeButton(_ title: String, action: @escaping () -> Void) -> UIButton {
        var cfg = UIButton.Configuration.filled()
        cfg.title = title
        cfg.cornerStyle = .large
        let b = UIButton(configuration: cfg, primaryAction: UIAction { _ in action() })
        return b
    }
}
