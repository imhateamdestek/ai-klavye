import SwiftUI

@main
struct AIKeyboardApp: App {
    var body: some Scene {
        WindowGroup {
            SetupView()
        }
    }
}

struct SetupView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Kurulum") {
                    Step(n: 1, t: "Ayarlar → Genel → Klavye → Klavyeler")
                    Step(n: 2, t: "Yeni Klavye Ekle → AI Klavye")
                    Step(n: 3, t: "AI Klavye'ye dokun → Tam Erişime İzin Ver")
                }
                Section("Kullanım") {
                    Text("Herhangi bir yazı alanında dünya simgesine basılı tutup AI Klavye'yi seçin.")
                        .font(.callout)
                }
                Section {
                    Button("Ayarları Aç") {
                        if let u = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(u)
                        }
                    }
                }
            }
            .navigationTitle("AI Klavye")
        }
    }
}

struct Step: View {
    let n: Int
    let t: String
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(n)")
                .font(.footnote.weight(.bold))
                .foregroundStyle(.white)
                .frame(width: 22, height: 22)
                .background(Circle().fill(.tint))
            Text(t)
        }
        .padding(.vertical, 2)
    }
}
