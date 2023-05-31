# frozen_string_literal: true

module Calculator
  class MyCalculator
    def add(a, b)
      a + b
    end

    def subtract(a, b)
      a - b
    end

    def multiply(a, b)
      a * b
    end

    def divide(a, b)
      raise ArgumentError, 'Cannot divide by zero' if b.zero?

      a / b
    end

    def modulo(a, b)
      a % b
    end
  end
end
