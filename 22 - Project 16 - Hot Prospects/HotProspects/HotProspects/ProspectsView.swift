//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Alvaro Valdes Salazar on 09-07-21.
//


import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {

    @State private var showingActionSheet = false

    enum FilterType {
        case none, contacted, uncontacted
    }
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false

    let filter: FilterType

    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                            Text("Date added: \(prospect.dateAdded, style: .date)")
                                .foregroundColor(.secondary)
                            
                        }
                        .contextMenu {
                            Button(action: {
                                self.prospects.toggle(prospect)
                            }) {
                                prospect.isContacted ? Label("Mark Uncontacted", systemImage: "person.badge.minus") : Label("Mark Contacted", systemImage: "person.badge.plus.fill")

                                
                            }
                            if !prospect.isContacted {
                                Button("Remind Me") {
                                    self.addNotification(for: prospect)
                                }
                            }
                    }
//CHALLENGE 1 - Add an icon to the “Everyone” screen showing whether a prospect was contacted or not.

                        Spacer()
                        Image(systemName: (prospect.isContacted ? "checkmark.circle.fill" :"x.circle"))
//=======
                    }.padding()
                }
            }
            .navigationBarTitle(title)
            .navigationBarItems(leading: Button(action: {
                self.showingActionSheet = true
            }) {
                Label("Sort", systemImage: "arrow.up.arrow.down.circle")
            }, trailing: Button(action: {
                self.isShowingScanner = true
            }) {
                Label("Scan", systemImage: "qrcode.viewfinder")
            }
            )
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: generateSimulatedData(), completion: self.handleScan)
            }
//CHALLENGE 3: Use an action sheet to customize the way users are sorted in each screen – by name or by most recent.
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Sort by") , message: Text("Choose a method of sorting the data"), buttons: [
                    .default(Text("By name")) { prospects.sort(by:.name) },
                    .default(Text("By date added")) { prospects.sort(by: .dateAdded)}
                ])
            }
            
        }
        
    }
    func generateSimulatedData() -> String {
      let firstNames = ["John", "Bob", "Alice", "Paul", "Ralf", "Baba"]
      let lastNames = ["Doe", "Voss", "Smith", "Gates", "Ampelmann"]
      let firstName = firstNames[Int.random(in: 0..<firstNames.count)]
      let lastName = lastNames[Int.random(in: 0..<lastNames.count)]
      let email = "\(firstName.lowercased())@\(lastName.lowercased()).com"

      return "\(firstName) \(lastName)\n\(email)"
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
       self.isShowingScanner = false
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]

            self.prospects.add(person)
        case .failure(let error):
            print("Scanning failed")
        }
        
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            //for testing purposes
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
        
    }
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
