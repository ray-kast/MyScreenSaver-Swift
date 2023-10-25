import AppKit
import MyScreenSaver

let SIZE = CGSize.init(width: 1280, height: 720)
let app = NSApplication.shared

class Delegate: NSObject, NSApplicationDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {
        guard let scr = MyScreenSaverView.init(frame: .init(origin: .zero, size: SIZE), isPreview: true) else {
            print("Unable to instantiate screensaver")
            app.terminate(self)
            return
        }

        let ctrl = Controller()
        ctrl.scr = scr
        let win = NSWindow.init(contentViewController: ctrl)

        win.title = "MyScreenSaver"
        win.setFrame(.init(origin: .zero, size: SIZE), display: false)
        win.center()
        win.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}

class Controller: NSViewController {
    var scr: MyScreenSaverView!

    override func loadView() {
        let view = NSView.init()

        view.addSubview(scr)

        NSLayoutConstraint.activate([
            scr.widthAnchor.constraint(equalTo: view.widthAnchor),
            scr.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        scr.startAnimation()

        self.view = view
    }
}

let del = Delegate()
app.delegate = del
app.setActivationPolicy(.regular)
app.run()
