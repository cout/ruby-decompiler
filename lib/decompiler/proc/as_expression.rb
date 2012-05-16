require 'internal/proc'

require 'decompiler/node/as_expression'
require 'decompiler/proc/signature'

class Proc
  # Return a single-line string representation of a proc's
  # definition/body, similarly to +Method#as_expression+.
  def as_expression
    sig = self.signature
    body_expression = self.body ? self.body.as_expression : nil
    s = sig.args.unspecified ? "" : sig.to_s + ' '
    b = body_expression ? body_expression + ' ' : ''
    return "proc { #{s}#{b}}"
  end
end

