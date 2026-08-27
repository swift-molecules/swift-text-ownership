public import Byte
public import Ownership
public import Text

extension Text: Ownership.Borrow.`Protocol` {

    public typealias Borrowed = Swift.Span<Byte>
}
