
import SwiftUI


struct RotatedBadgeSymbol: View {
    let angle: Angle
    var colorRotatedBadgeSymbol: Color
    
    var body: some View {
        BadgeSymbol(symbolColor: colorRotatedBadgeSymbol)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}


#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5), colorRotatedBadgeSymbol: Color("DarkGreen"))
}
