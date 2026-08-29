public import Byte
public import Ownership_Borrow
public import Text

/// Uses a read-only byte span as the Text domain's borrowed representation.
extension Text: @retroactive Ownership.Borrow.`Protocol` {

    public typealias Borrowed = Swift.Span<Byte>
}
