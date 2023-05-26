import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter City Name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
            }.font(.custom("Sans Pro", size: 50)).padding().fixedSize()
            
            Text(self.weatherVM.temperature).font(.custom("Sans Pro", size: 100)).foregroundColor(Color.white).offset(y: 100).padding()
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(Color.green).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
