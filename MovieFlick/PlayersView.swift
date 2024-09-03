//
//  PlayersView.swift
//  MovieFlick
//
//  Created by Alex  on 16/8/24.
//

import SwiftUI

struct PlayersView: View {
    @Environment(MovieFlickViewModel.self) var vm
    
    var addPlayerText: String {
        if vm.playersName.count < 4 {
            return "Add new player +"
        } else {
            return "Max. 4 players"
        }
    }
    
    var body: some View {
        @Bindable var bvm = vm
        VStack {
            Text("Create your players")
                .font(.title)
                .bold()
                .foregroundStyle(Color.yellow)
            Spacer()
            ForEach(vm.playersName.indices, id: \.self) { index in
                HStack {
                    PlayerTextField(backgroundText: "Player \(index + 1)", text: $bvm.playersName[index], color: .green)
                    AppButton(title: "–", color: .red, animation: nil, isDissabled: (vm.playersName.count > 2)) {
                        vm.playersName.remove(at: index)
                    }
                    .frame(width: 50)
                    
                }
            }
            AppButton(title: addPlayerText, color: Color.yellow) {
                if vm.playersName.count < 4 {
                    vm.playersName.append("")
                }
            }
            Spacer()
            AppButton(title: "Continue") {
                vm.viewState = .chooseTypeView
            }
        }
        .padding(.top, 48)
        .animation(.smooth, value: vm.playersName)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .appBackground()
    }
}

#Preview {
    PlayersView()
        .environment(MovieFlickViewModel())
}
