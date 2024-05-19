//
//  HeartbeatSim.swift
//  MyCareConn
//
//  Created by Astrian Zheng on 19/5/2024.
//

import Foundation // 引入 Foundation 框架以使用随机数生成器

struct HeartbeatStats: Identifiable {
    let id: Int // 分钟数作为唯一标识
    let min: Int
    let max: Int
}

func heartbeatSim(startHeartbeat: Int, peakHeartbeat: Int, endHeartbeat: Int) -> [HeartbeatStats] {
    var heartbeatStats: [HeartbeatStats] = []
    var currentMin = Int.max
    var currentMax = Int.min
    var currentInterval = 1

    for i in 0..<3600 { // Iterate over seconds in an hour
        let heartbeat: Int
        if i < 900 { // First quarter: increasing
            heartbeat = startHeartbeat + (peakHeartbeat - startHeartbeat) * i / 900
        } else if i < 2700 { // Middle half: fluctuating around peak
            heartbeat = peakHeartbeat + Int.random(in: -10...10)
        } else { // Last quarter: decreasing
            heartbeat = peakHeartbeat - (peakHeartbeat - endHeartbeat) * (i - 2700) / 900
        }

        currentMin = min(currentMin, heartbeat)
        currentMax = max(currentMax, heartbeat)

        if i % 300 == 299 { // End of a 5-minute interval (0-indexed)
            heartbeatStats.append(HeartbeatStats(id: currentInterval, min: currentMin, max: currentMax))
            currentMin = Int.max
            currentMax = Int.min
            currentInterval += 1
        }
    }

    return heartbeatStats
}
