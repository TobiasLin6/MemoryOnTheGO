//
//  UniversalImage.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 1/16/26.
//

import Foundation

enum UniversalImage: Identifiable, Codable, Sendable {
    case asset(String)
    case imageData(Data)
    case symbol(String)
    
    var id: String {
        switch self {
        case .asset(let name): return "asset-\(name)"
        case .imageData(let data): return "data-\(data.hashValue)"
        case .symbol(let name): return "symbol-\(name)"
        }
    }
    
    func encode() -> String {
        switch self {
        case .asset(let name): return "asset:\(name)"
        case .symbol(let name): return "symbol:\(name)"
        case .imageData(let data): return "data:\(data.base64EncodedString())"
        }
    }

    static func decode(from raw: String) -> UniversalImage {
        let parts = raw.split(separator: ":", maxSplits: 1).map(String.init)
        guard parts.count == 2 else { return .symbol("photo") }
        
        switch parts[0] {
        case "asset": return .asset(parts[1])
        case "data": return .imageData(Data(base64Encoded: parts[1]) ?? Data())
        default: return .symbol(parts[1])
        }
    }
    
//    // MARK: - Manual Codable Implementation
//        private enum CodingKeys: String, CodingKey {
//            case type, value
//        }
//
//        nonisolated func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: CodingKeys.self)
//            switch self {
//            case .asset(let name):
//                try container.encode(0, forKey: .type)
//                try container.encode(name, forKey: .value)
//            case .imageData(let data):
//                try container.encode(1, forKey: .type)
//                try container.encode(data, forKey: .value)
//            case .symbol(let name):
//                try container.encode(2, forKey: .type)
//                try container.encode(name, forKey: .value)
//            }
//        }
//
//        nonisolated init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            let type = try container.decode(Int.self, forKey: .type)
//            switch type {
//            case 0: self = .asset(try container.decode(String.self, forKey: .value))
//            case 1: self = .imageData(try container.decode(Data.self, forKey: .value))
//            default: self = .symbol(try container.decode(String.self, forKey: .value))
//            }
//        }
}


