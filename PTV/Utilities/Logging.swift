//
//  Logging.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

private var itemsToLog: Set<LogType> = Set(LogType.allCases)

enum LogType: CaseIterable {

    case json
    case verbose
    case info
    case auth
    case session
    case error
    case secureStorage
    case webservice
    case analytics

    var toLog: String {
        switch self {
        case .info: return "ℹ️ "
        case .verbose: return "⏩ "
        case .webservice: return "⚙️ "
        case .analytics: return "📈 "
        case .json: return "📜 "
        case .auth: return "🟢 "
        case .session: return "🧭 "
        case .error: return "‼️ "
        case .secureStorage: return "🔒 "
        }
    }

    static func setItemsToLog(to newItemsToLog: [LogType]) {
        itemsToLog = Set(newItemsToLog)
    }
}

// #if DEBUG

struct LogItem: Identifiable {
    let date = Date()
    let id = UUID()
    let type: LogType
    let text: String
}

private var logs = [LogItem]()

private func appendToLog(_ logString: String, _ type: LogType) {
    logs.append(LogItem(type: type, text: logString))
}

func getLogs() -> [LogItem] { logs }

// #endif

func log(_ object: Any?, _ logType: LogType) {
    if itemsToLog.contains(logType) {
        let logString = "\(object ?? "")"
        // swiftlint:disable use_log_not_print
        print("\(logType.toLog)\(logString)")
        // #if DEBUG
        appendToLog(logString, logType)
        // #endif
    }

}
