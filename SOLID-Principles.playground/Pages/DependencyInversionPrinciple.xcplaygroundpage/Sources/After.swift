import Foundation

fileprivate protocol AnalyticsTracker {
    func trackScreen(_ screenName: String)
}

fileprivate struct GoogleAnalytics: AnalyticsTracker {
    func trackScreen(_ screenName: String) {
        print("Running Google Analytics")
    }
}

fileprivate struct Matomo {
    func trackScreenView(_ nameOfScreen: String) {
        print("Running Matomo Analytics")
    }
}

extension Matomo: AnalyticsTracker {
    func trackScreen(_ screenName: String) {
        trackScreenView(screenName)
    }
}

fileprivate struct Segment {
    func setViewScreen(name: String) {
        print("Running Segment Analytics")
    }
}

extension Segment: AnalyticsTracker {
    func trackScreen(_ screenName: String) {
        setViewScreen(name: screenName)
    }
}

// MARK: We now have the flexibility to choose which Analytics Tracker we want, inverting the dependency

fileprivate struct ProductsViewController {

    let analyticsTracker: AnalyticsTracker

    func trackScreen(_ screenName: String) {
        analyticsTracker.trackScreen(screenName)
    }

}

// MARK: And if we need to use a new Analytics Tracker, it just needs to conform to the protocol

fileprivate struct AnotherAnalyticsTracker {
    func screenView(name: String, tag: String) {
        print("Running Another Analytics")
    }
}

extension AnotherAnalyticsTracker: AnalyticsTracker {
    func trackScreen(_ screenName: String) {
        screenView(name: screenName, tag: "")
    }
}

// MARK: Examples

fileprivate struct Example01 {
    func track() {
        let google = GoogleAnalytics()
        let productsVC = ProductsViewController(analyticsTracker: google)
        productsVC.trackScreen("Products view")
    }
}

fileprivate struct Example02 {
    func track() {
        let matomo = Matomo()
        let productsVC = ProductsViewController(analyticsTracker: matomo)
        productsVC.trackScreen("Products view")
    }
}

fileprivate struct Example03 {
    func track() {
        let segment = Segment()
        let productsVC = ProductsViewController(analyticsTracker: segment)
        productsVC.trackScreen("Products view")
    }
}

