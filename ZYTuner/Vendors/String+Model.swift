//
//  String+Model.swift
//  ZYTuner
//
//  Created by joox on 2022/12/9.
//

import Foundation

extension String {
    func model<T>(type: T.Type) -> T? where T : Decodable {
        var result: T?
        do {
            guard let data = self.data(using: .utf8) else { return nil }
            result = try JSONDecoder().decode(type, from: data)
        } catch (let e){
            print("\(e)")
        }
        return result
    }
}
