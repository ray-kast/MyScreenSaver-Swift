import ScreenSaver

public class MyScreenSaverView: ScreenSaverView {
    let rect: NSRect!

    public override init?(frame: NSRect, isPreview: Bool) {
        rect = frame
        super.init(frame: frame, isPreview: isPreview)
    }

    required init?(coder: NSCoder) { return nil }

    public override class func performGammaFade() -> Bool { true }

    // public override func draw(_ rect: NSRect) {
    // }

    public override func animateOneFrame() {
        // setNeedsDisplay(rect)
    }
}
