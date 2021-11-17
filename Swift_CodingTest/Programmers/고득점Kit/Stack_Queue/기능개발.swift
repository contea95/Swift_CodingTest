//
//  main.swift
//  Swift_CodingTest
//
//  Created by 한상혁 on 2021/11/16.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var cpProgressesArray: [Int] = progresses
    var cpSpeedsArray: [Int] = speeds
    var result: [Int] = []
    var cntOver100: Int = 0
    while true {
        if cpProgressesArray.count == 0 {
            break
        } else {
            // 처음 progresses가 100이 될 때까지 반복할 횟수 구하기
            var loopCnt: Int
            loopCnt = Int(ceil(Double((100 - cpProgressesArray[0])) / (Double(cpSpeedsArray[0]))))
            print("loopCnt: \(loopCnt)")
            // 첫 값이 100 이상이 되도록 수를 더하기
            cpProgressesArray.enumerated().forEach {
                cpProgressesArray[$0.offset] += cpSpeedsArray[$0.offset] * loopCnt
            }
            print(cpProgressesArray)
            for i in cpProgressesArray {
                if i >= 100 {
                    cntOver100 += 1
                } else {
                    break
                }
            }
//            cpProgressesArray.enumerated().forEach {
//                if cpProgressesArray[$0.offset] >= 100 {
//                    cntOver100 += 1
//                }
//            }
            result.append(cntOver100)
            for _ in 1...cntOver100 {
                cpProgressesArray.removeFirst()
                cpSpeedsArray.removeFirst()
                cntOver100 = 0
            }
        }
    }
    print("result: \(result)")
    return result
}

solution([95,95], [2, 1])
