//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 15.11.2021.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    @State private var animate = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                }
            }
            
            Spacer()
            
            if showAward {
                GuitarView()
                    .frame(width: 300, height: 500)
                    .transition(.transition)
                    .padding(animate ? 30 : 50)
                    .shadow(
                        color: animate
                        ? secondaryAccentColor.opacity(0.7)
                        : Color.accentColor.opacity(0.7),
                        radius: animate ? 40 : 20,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                    .onAppear(perform: addAnimation)
                    .onDisappear(perform: { animate.toggle() })
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

extension MainView {
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
    
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
            .combined(with: .slide)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
            .combined(with: .scale)
            .combined(with: .slide)
        
        return .asymmetric(
            insertion: insertion,
            removal: removal
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
