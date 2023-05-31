# frozen_string_literal: true

require_relative '../../my_calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator::MyCalculator.new }

  it 'should add two numbers' do
    expect(calculator.add(2, 3)).to eq(5)
  end

  it 'should subtract two numbers' do
    expect(calculator.subtract(5, 2)).to eq(3)
  end

  it 'should multiply two numbers' do
    expect(calculator.multiply(5, 2)).to eq(10)
  end

  it 'should divide two numbers' do
    expect(calculator.divide(100, 5)).to eq(20)
  end

  it 'should raise an error upon dividing by zero' do
    expect { calculator.divide(5, 0) }.to raise_error(ArgumentError, 'Cannot divide by zero')
  end
end
