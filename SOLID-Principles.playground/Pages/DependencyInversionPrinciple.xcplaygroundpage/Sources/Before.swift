import Foundation

fileprivate struct GoogleAnalytics {
    func trackScreen(_ screenName: String) {
        print("Running Google Analytics")
    }
}

fileprivate struct Matomo {
    func trackScreenView(_ nameOfScreen: String) {
        print("Running Matomo Analytics")
    }
}

fileprivate struct Segment {
    func setViewScreen(name: String) {
        print("Running Segment Analytics")
    }
}

fileprivate enum AnalyticsTrackerType {
    case googleAnalytics
    case matomo
    case segment
}

// MARK: We are creating a new case for each Analytics Tracker that we need to support

fileprivate struct ProductsViewController {

    let analyticsTrackerType: AnalyticsTrackerType

    func trackScreen(_ screenName: String) {
        switch analyticsTrackerType {
        case .googleAnalytics:
            GoogleAnalytics().trackScreen(screenName)
        case .matomo:
            Matomo().trackScreenView(screenName)
        case .segment:
            Segment().setViewScreen(name: screenName)
        }
    }
}
