import Foundation

@Observable
class SettingsManager {
    static let shared = SettingsManager()

    var showNotch: Bool {
        didSet { UserDefaults.standard.set(showNotch, forKey: "replaceNotch") }
    }

    var soundsEnabled: Bool {
        didSet { UserDefaults.standard.set(soundsEnabled, forKey: "soundsEnabled") }
    }

    var xcodeIntegrationEnabled: Bool {
        didSet { UserDefaults.standard.set(xcodeIntegrationEnabled, forKey: "xcodeIntegrationEnabled") }
    }

    var claudeIntegrationEnabled: Bool {
        didSet { UserDefaults.standard.set(claudeIntegrationEnabled, forKey: "claudeIntegrationEnabled") }
    }

    /// "builtin" or "external" — falls back to built-in if no external is connected
    var preferredDisplay: String {
        didSet { UserDefaults.standard.set(preferredDisplay, forKey: "preferredDisplay") }
    }

    var autoCompactEnabled: Bool {
        didSet { UserDefaults.standard.set(autoCompactEnabled, forKey: "autoCompactEnabled") }
    }

    init() {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "replaceNotch") == nil { defaults.set(true, forKey: "replaceNotch") }
        if defaults.object(forKey: "soundsEnabled") == nil { defaults.set(true, forKey: "soundsEnabled") }
        if defaults.object(forKey: "xcodeIntegrationEnabled") == nil { defaults.set(true, forKey: "xcodeIntegrationEnabled") }
        if defaults.object(forKey: "claudeIntegrationEnabled") == nil { defaults.set(true, forKey: "claudeIntegrationEnabled") }
        if defaults.object(forKey: "preferredDisplay") == nil { defaults.set("builtin", forKey: "preferredDisplay") }
        if defaults.object(forKey: "autoCompactEnabled") == nil { defaults.set(true, forKey: "autoCompactEnabled") }

        showNotch = defaults.bool(forKey: "replaceNotch")
        soundsEnabled = defaults.bool(forKey: "soundsEnabled")
        xcodeIntegrationEnabled = defaults.bool(forKey: "xcodeIntegrationEnabled")
        claudeIntegrationEnabled = defaults.bool(forKey: "claudeIntegrationEnabled")
        preferredDisplay = defaults.string(forKey: "preferredDisplay") ?? "builtin"
        autoCompactEnabled = defaults.bool(forKey: "autoCompactEnabled")
    }
}
