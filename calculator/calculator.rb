# frozen_string_literal: true

class Calculator

  @calculator_data = {
    'first_value' => 0,
    'operation' => '',
    'second_value' => 0,
    'result' => 0
  }

  # methods calls counter
  @check_if_user_is_dumb_count = 0

  TracePoint.trace(:call) do |trace|
    @check_if_user_is_dumb_count += 1 if trace.method_id == :check_if_user_is_dumb
  end

  @select_operation_count = 0

  TracePoint.trace(:call) do |trace|
    @select_operation_count += 1 if trace.method_id == :select_operation
  end
  # -

  def self.evaluate
    @calculator_data['result'] = @calculator_data['first_value'].send(@calculator_data['operation'].to_sym, @calculator_data['second_value'])
  end

  def self.select_operation
    puts "\nPlease select your operation by choosing a number"
    puts "[1] Add (+) \n" \
           "[2] Subtract (-) \n" \
           "[3] Multiply (*) \n" \
           "[4] Divide (/) \n"

    print 'Input number of operation: '
    choice = gets.chomp
    dumb = check_if_user_is_dumb(choice, 'operation')

    retry_input('operation') if dumb
  end

  def self.check_if_user_is_dumb(value, type)
    # check regex for different value situations
    situation = value_checker(value, type)

    case situation
    when 'A', 'S', 'WO' # A - alpha, S - special characters, WO - wrong option

      flow = situation == 'A' ? 'alpha' : 'special'

      while @check_if_user_is_dumb_count < 4 # only 3 tries
        case @check_if_user_is_dumb_count
        when 1
          if situation == 'WO'
            print "We have only 4 options here, so please choose one of them: "
          else
            print "I wish we could do such evaluation. Try again (no #{flow} characters please): "
          end
          break
        when 2
          if situation == 'WO'
            print "For more options please contact your administrator. For now just choose one that exists: "
          else
            print "Please, no, #{flow}, characters. Try again: "
          end
          break
        when 3
          print 'You have one more try: '
          break
        end
      end

      true # it's truly dumb

    when 'Smart'
      case type
      when 'first_value'
        @calculator_data['first_value'] = value.include?('.') ? value.to_f : value.to_i
      when 'second_value'
        @calculator_data['second_value'] = value.include?('.') ? value.to_f : value.to_i
      when 'operation'
        @calculator_data['operation'] = case value
                                        when '1' then '+'
                                        when '2' then '-'
                                        when '3' then '*'
                                        when '4' then '/'
                                        else abort('Oh no, something went wrong...')
                                        end
      end
      false # not dumb, congrats
    end
  end

  def self.retry_input(type)
    check_if_user_is_dumb(gets.chomp, type)
  end

  def self.value_checker(value, type)
    if value =~ /[A-Za-z]/
      'A' # alpha characters
    elsif value =~ %r{[=*+/,()!@#$%^&_|?<>"':;\[\]`~\\]}
      'S' # special characters
    elsif type == 'operation' && (value.size > 1 || value =~ /[^1234]/)
      'WO' # wrong operation
    elsif value =~ /(?<=^| )\d+(\.\d+)?(?=$| )/
      'Smart'
    else
      abort("\nYou broke me, are you happy?")
    end
  end

  ### Watch out, magic down below ###
  puts "\nYet another calculator :/"

  print "\nYour first value please: "
  @calculator_data['first_value'] = gets.chomp
  user_is_dumb = check_if_user_is_dumb(@calculator_data['first_value'], 'first_value')
  while @check_if_user_is_dumb_count < 4 && user_is_dumb
    really_dumb = false # i hope so...
    really_dumb = retry_input('first_value') if user_is_dumb
    abort("\nSorry, but you are not being serious. Come later.") if @check_if_user_is_dumb_count == 4 && really_dumb
    user_is_dumb = false unless really_dumb
  end

  # reset data
  @check_if_user_is_dumb_count = 0

  user_is_dumb = select_operation
  while @check_if_user_is_dumb_count < 4 && user_is_dumb
    really_dumb = false # i hope so...
    really_dumb = retry_input('operation') if user_is_dumb
    abort("\nSorry, but you are not being serious. Come later.") if @check_if_user_is_dumb_count == 4 && really_dumb
    user_is_dumb = false unless really_dumb
  end

  # reset data
  @check_if_user_is_dumb_count = 0

  print "\nYour second value please: "
  @calculator_data['second_value'] = gets.chomp
  user_is_dumb = check_if_user_is_dumb(@calculator_data['second_value'], 'second_value')
  while @check_if_user_is_dumb_count < 4 && user_is_dumb
    really_dumb = false # i hope so...
    really_dumb = retry_input('second_value') if user_is_dumb
    abort("\nSorry, but you are not being serious. Come later.") if @check_if_user_is_dumb_count == 4 && really_dumb
    user_is_dumb = false unless really_dumb
  end

  evaluate

  puts "\n#{@calculator_data['first_value']} #{@calculator_data['operation']} #{@calculator_data['second_value']} = #{@calculator_data['result']}"
  puts "\nThanks for wasting your time and have a nice day :)"
end
