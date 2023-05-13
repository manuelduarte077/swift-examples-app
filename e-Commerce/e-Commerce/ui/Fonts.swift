import SwiftUI

enum FontSize: CGFloat {
    case
    xsmall = 14,
    small = 16,
    medium = 18,
    xlarge = 36
}

struct ECStyle {
    var font : Font = .custom(Font.RedHatDisplay.book.value, size: FontSize.small.rawValue)
    var color : Color = .textPrimary
    var underline: Bool = false
}

extension ECStyle {
    static func normal() -> ECStyle {
        return ECStyle()
    }

    static func title() -> ECStyle {
        return ECStyle(font: .custom(Font.RedHatDisplay.book.value, size: FontSize.xlarge.rawValue))
    }

    static func subtitle(color: Color = .textPrimary) -> ECStyle {
        return ECStyle(
            font: .custom(Font.RedHatDisplay.book.value, size: FontSize.medium.rawValue),
            color: color
        )
    }

    static func button(color: Color = .systemBackground) -> ECStyle {
        return ECStyle(
            font: .custom(Font.RedHatDisplay.bold.value, size: FontSize.small.rawValue),
            color: color
        )
    }

    static func link(color: Color = .textPrimary, underline: Bool = false) -> ECStyle {
        return ECStyle(
            font: .custom(Font.RedHatDisplay.bold.value, size: FontSize.xsmall.rawValue),
            color: color,
            underline: underline
        )
    }
    
    static func caption(color: Color = .textPrimary) -> ECStyle {
        return ECStyle(
            font: .custom(Font.RedHatDisplay.book.value, size: FontSize.xsmall.rawValue),
            color: color
        )
    }
}

extension Font {
    
    enum RedHatDisplay {
        case book
        case bold
        
        var value: String {
            switch self {
            case .book:
                return "RedHatDisplay-SemiBold"
            case .bold:
                return "RedHatDisplay-Bold"
            }
        }
    }
}
