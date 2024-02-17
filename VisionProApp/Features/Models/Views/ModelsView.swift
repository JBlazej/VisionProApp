//
//  Models.swift
//  VisionProApp
//
//  Created by Jan Blazej on 14.02.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ModelsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    VStack {
                        Text("Model")
                            .font(.largeTitle)
                        HStack {
                            VStack {
                                Text("item")
                                    .font(.largeTitle)
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                    Model3D(named: "Capsule", bundle: realityKitContentBundle) { model in
                                        model
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .border(.red)
                                    .aspectRatio(1.5, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .frame(width: 200, height: 200)
                            .glassBackgroundEffect()
                        }
                        
                        HStack {
                            VStack {
                                Text("item")
                                    .font(.largeTitle)
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                    Model3D(named: "Capsule", bundle: realityKitContentBundle) { model in
                                        model
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .border(.red)
                                    .aspectRatio(1.5, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .frame(width: 200, height: 200)
                            .glassBackgroundEffect()
                        }
                        
                        HStack {
                            VStack {
                                Text("item")
                                    .font(.largeTitle)
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                    Model3D(named: "Capsule", bundle: realityKitContentBundle) { model in
                                        model
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .border(.red)
                                    .aspectRatio(1.5, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .frame(width: 200, height: 200)
                            .glassBackgroundEffect()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
    }
}

#Preview {
    ModelsView()
        .environment(ViewModel())
}
