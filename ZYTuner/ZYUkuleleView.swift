//
//  ZYUkuleleView.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI

struct ZYUkuleleView: View {
    
    @Binding var selected: String
    @Binding var selectedNote: String
    @Binding var selectedOctave: String
    
    private var itemWidth = 60.0
    private var datas = [["C4", "E4"], ["G4", "A4"]]
    
    init(selected: Binding<String>, selectedNote: Binding<String>, selectedOctave: Binding<String>) {
        self._selected = selected
        self._selectedNote = selectedNote
        self._selectedOctave = selectedOctave
    }
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(datas, id: \.self) { items in
                let index: CGFloat = CGFloat(datas.count) - CGFloat(datas.firstIndex(of: items) ?? 0)
                HStack(spacing: 35 + (25 * index)) {
                    ForEach(items, id: \.self) { item in
                        Button {
                            selected = item
                        } label: {
                            Text(item)
                                .frame(width: itemWidth, height: itemWidth)
                                .background(itemBackground(item: item))
                                .foregroundColor(itemTitleColor(item: item))
                        }
                    }
                }
            }
        }
        .onChange(of: selected) { newValue in
            let chars = newValue.map { String($0) }
            selectedNote = chars.first ?? ""
            selectedOctave = chars.last ?? ""
        }
    }
    
    private func itemTitleColor(item: String) -> Color {
        if selected == item {
            return Color("lemon-yellow")
        } else {
            return Color.white.opacity(0.45)
        }
    }
    
    @ViewBuilder
    private func itemBackground(item: String) -> some View {
        if selected == item {
            RoundedRectangle(cornerRadius: itemWidth/2.0).stroke().foregroundColor(Color("lemon-yellow"))
        } else {
            RoundedRectangle(cornerRadius: itemWidth/2.0).stroke().foregroundColor(Color.white.opacity(0.45))
        }
    }
}
