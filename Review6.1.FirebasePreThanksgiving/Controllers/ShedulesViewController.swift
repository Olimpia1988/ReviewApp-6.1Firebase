import UIKit
import EventKit

class SchedulesViewController: UIViewController {
        
    let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        calendarPermissions()
    }
    
    private func calendarPermissions() {
        switch EKEventStore.authorizationStatus(for: .event) {
                 case .authorized:
                     insertEvent(store: eventStore)
                     case .denied:
                         print("Access denied")
                     case .notDetermined:
                         eventStore.requestAccess(to: .event, completion:
                           {[weak self] (granted: Bool, error: Error?) -> Void in
                               if granted {
                                  self!.insertEvent(store: self!.eventStore)
                               } else {
                                     print("Access denied")
                               }
                         })
                         default:
                             print("Case default")
                 }
    }
    
    func insertEvent(store: EKEventStore) {
        let calendars = store.calendars(for: .event)
            
        for calendar in calendars {
            if calendar.title == "ioscreator" {
                let startDate = Date()
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                    
                event.title = "New Meeting"
                event.startDate = startDate
                event.endDate = endDate
                    
                do {
                    try store.save(event, span: .thisEvent)
                }
                catch {
                   print("Error saving event in calendar")             }
                }
        }
    }
    
}

