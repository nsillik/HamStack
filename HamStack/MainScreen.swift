//
//  ContentView.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

import SwiftUI
import SwiftData

struct MainScreen: View {

  @State private var selectedItem: Screen = Screen.allCases.first!

  enum Screen: String, CaseIterable, Identifiable {
    case nato = "NATO"
    case bandplan = "Band Plan"

    func title() -> Text {
      Text(rawValue)
    }

    var id: String { self.rawValue }

    @ViewBuilder var detailView: some View {
      switch self {
      case .nato:
        NATOScreen()
      case .bandplan:
        BandplanScreen()
      }
    }
  }

  var body: some View {
    NavigationSplitView {
      VStack(alignment: .leading) {
        Text("")
        ForEach(Screen.allCases) { screen in
          VStack {
            HStack {
              screen.title()
              Spacer()
            }
            .onTapGesture {
              self.selectedItem = screen
            }
          }
          .font(.title)
          .padding()
          .background((screen == selectedItem ? Color.orange : Color.clear).opacity(0.4))
        }
        Spacer()
      }
    } detail: {
      selectedItem.detailView
    }

  }
  //    @Environment(\.modelContext) private var modelContext
  //    @Query private var items: [Item]

  //    var body: some View {
  //        NavigationSplitView {
  //            List {
  //                ForEach(items) { item in
  //                    NavigationLink {
  //                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
  //                    } label: {
  //                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
  //                    }
  //                }
  //                .onDelete(perform: deleteItems)
  //            }
  //#if os(macOS)
  //            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
  //#endif
  //            .toolbar {
  //#if os(iOS)
  //                ToolbarItem(placement: .navigationBarTrailing) {
  //                    EditButton()
  //                }
  //#endif
  //                ToolbarItem {
  //                    Button(action: addItem) {
  //                        Label("Add Item", systemImage: "plus")
  //                    }
  //                }
  //            }
  //        } detail: {
  //            Text("Select an item")
  //        }
  //    }

  //    private func addItem() {
  //        withAnimation {
  //            let newItem = Item(timestamp: Date())
  //            modelContext.insert(newItem)
  //        }
  //    }
  //
  //    private func deleteItems(offsets: IndexSet) {
  //        withAnimation {
  //            for index in offsets {
  //                modelContext.delete(items[index])
  //            }
  //        }
  //    }
}

#Preview {
  MainScreen()
    .modelContainer(for: Item.self, inMemory: true)
}
