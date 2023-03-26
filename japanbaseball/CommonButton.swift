//
//  CommonButton.swift
//  japanbaseball
//
//  Created by 松尾健司 on 2023/03/26.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button {
        dismiss()
            } label: {
            Text("back")
        }
    }
}

struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
