import SwiftUI

struct RootAppView: View {
    @EnvironmentObject var auth: AuthModal
    
    @ViewBuilder
    var body: some View {
        if auth.isLogin {
            BottomTabView()
        }else {
            LoginView()
        }
    }
}

struct
RootAppView_Previews: PreviewProvider {
    static var previews: some View {
        RootAppView().environmentObject(AuthModal())
    }
}
