Ruby-decompiler is a decompiler for ruby code.  With it you can...

View method signatures:

  irb(main):015:0> def foo(a, b, *rest, &block); end; method(:foo).signature
  => #<MethodSig::Signature:0x4037093c @origin_class=Object, @arg_info={:b=>"b",
  :block=>"&block", :a=>"a", :rest=>"*rest"}, @name="foo", @arg_names=[:a,
  :b, :rest, :block]>
  irb(main):016:0> proc { |x, y, *rest| }.signature
  => #<Proc::Signature:0x4036cf30 @args=#<Proc::Arguments:0x4036d020 @rest_arg=2,
  @multiple_assignment=true, @names=[:x, :y, :rest]>, @arg_info={:x=>"x", :y=>"y",
  :rest=>"*rest"}>

And reconstruct compiled methods:

  irb(main):001:0> def foo(a, b, *rest, &block)
  irb(main):002:1>   begin
  irb(main):003:2*     if not a and not b then
  irb(main):004:3*       raise "Need more input!"
  irb(main):005:3>     end
  irb(main):006:2>     return a + b
  irb(main):007:2>   ensure
  irb(main):008:2*     puts "In ensure block"
  irb(main):009:2>   end
  irb(main):010:1> end
  => nil
  irb(main):011:0> m = method(:foo)
  => #<Method: Object#foo>
  irb(main):012:0> puts m.as_code
  def foo(a, b, *rest, &block)
    begin
      (raise("Need more input!")) if (not a and not b)
      return a + b
    ensure
      puts("In ensure block")
    end
  end
  => nil
