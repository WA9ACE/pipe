require "pipe/version"

module Pipe
end

module Kernel
  def pipe(input)
    input.define_singleton_method(:|) do |filter|
      pipe filter.call(input)
    end

    input
  end
end