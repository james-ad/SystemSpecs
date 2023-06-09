//
//  PerformanceMetricsView.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/7/23.
//

import SwiftUI
import Darwin
import Foundation

struct PerformanceMetricsView: View {
    @State private var cpuUsage: Float = 0.0
    @State var isButtonTapped: Bool = false
    let backgroundColor = LinearGradient(
        colors: [
            Color(red: 0.17, green: 0.15, blue: 0.42),
            Color(red: 0.12, green: 0.1, blue: 0.25)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    let buttonColor = LinearGradient(
        colors: [
            Color(red: 0.51, green: 0.2, blue: 0.8),
            Color(red: 0.25, green: 0.15, blue: 0.75)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    func doSomething() {
        
        // TODO: Figure out what dynamic info can be gleaned from device and presented
        
        var hostBasicInfoCount = mach_msg_type_number_t(MemoryLayout<host_basic_info>.size / MemoryLayout<integer_t>.size)
        var hostInfo = host_basic_info()

        let result = withUnsafeMutablePointer(to: &hostInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(hostBasicInfoCount)) {
                host_info(mach_host_self(), HOST_BASIC_INFO, $0, &hostBasicInfoCount)
            }
        }

        if result == KERN_SUCCESS {
            print("CPU Type: \(hostInfo.cpu_type)")
            print("CPU Subtype: \(hostInfo.cpu_subtype)")
            print("CPU Thread Type: \(hostInfo.cpu_threadtype)")
            print("Physical CPU: \(hostInfo.physical_cpu)")
            print("Logical CPU: \(hostInfo.logical_cpu)")
            print("Max Memory: \(hostInfo.max_mem)")
            print("DA TING MON: \(UIDevice.current.batteryLevel * 100)")
            print("DA TING MON: \(cpuUsage)")
            print("DA TING MON: \(floor(Double(ProcessInfo().physicalMemory / 1000000000)))")
        } else {
            print("Failed to fetch CPU info")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProcessRowView()
            ProcessRowView()
            ProcessRowView()
            Button() {
                print("Inside button tapped")
            } label: {
                Text("See Specs")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .frame(width: 240, height: 40)
            .padding()
            .background(buttonColor)
            .cornerRadius(20, antialiased: true)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .circular)
            )
            .shadow(color: .black, radius: 5, x: 0, y: 5)
            .animation(.easeInOut(duration: 1), value: isButtonTapped)
            .onTapGesture {
                isButtonTapped.toggle()
                print("hola mi boa")
                doSomething()
            }
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 2)
                .background(backgroundColor)
                .cornerRadius(30)
        )
    }
    
    func getCPUUsage() -> Float {
        var cpuLoad: host_cpu_load_info_data_t = host_cpu_load_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<host_cpu_load_info_data_t>.size / MemoryLayout<integer_t>.size)
        let result: kern_return_t = withUnsafeMutablePointer(to: &cpuLoad) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &count)
            }
        }

        if result == KERN_SUCCESS {
            let totalTicks = cpuLoad.cpu_ticks.0 + cpuLoad.cpu_ticks.1 + cpuLoad.cpu_ticks.2 + cpuLoad.cpu_ticks.3
            let idleTicks = cpuLoad.cpu_ticks.2
            let usedTicks = totalTicks - idleTicks
            return Float(usedTicks) / Float(totalTicks)
        } else {
            return -1.0
        }
    }
}

struct PerformanceMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceMetricsView()
    }
}
