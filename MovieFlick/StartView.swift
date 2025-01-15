//
//  StartView.swift
//  MovieFlick
//
//  Created by Alex  on 16/8/24.
//

import SwiftUI

struct StartView: View {
    @Environment(MovieFlickViewModel.self) var vm
    @State var appConfig = AppConfig.shared
    
    var body: some View {
        VStack {
            Spacer()
            Image(.logoLetra)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            AppButton(title: "Start", color: .white) {
                vm.viewState = .playersView
            }
            Spacer()
            Picker("Env", selection: $appConfig.selectedEnvironment) {
                ForEach(Env.allCases) { env in
                    Text(env.rawValue).tag(env)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            VStack {
                Text("This product uses the TMDB API but is not endorsed or certified by TMDB.")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                Image(.tmdbLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 12)
            }
        }
        .padding(.horizontal)
        .appBackground(gradientOpacity: 0.5)
        .overlay (alignment: .topTrailing){
            Button {
                vm.viewState = .aboutLegalView
            } label: {
                Image(systemName: "info.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundStyle(.white)
            }
            .padding()
            .buttonStyle(PlainButtonStyle())

        }
    }

}

#Preview {
    StartView()
        .environment(MovieFlickViewModel())
}
