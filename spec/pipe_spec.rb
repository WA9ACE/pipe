require 'pry'
require 'spec_helper'

describe Pipe do
  it 'has a version number' do
    expect(Pipe::VERSION).not_to be nil
  end

  it 'implements pipe globally' do
    expect(Kernel.respond_to? :pipe).to eq(true)
  end

  it 'makes thing pipeable' do
    Reverse = -> (arr) { arr.reverse }
    Upcase  = -> (arr) { arr.map(&:upcase) }

    alphabet = ('a'..'z').to_a

    result = pipe(alphabet) | Reverse | Upcase

    expect(result).to eq(('A'..'Z').to_a.reverse)
  end
end
