class Calibration
  INPUT_PATH = 'day1/input.txt'.freeze
  WORD_TO_NUMBER = {
    'zero' => 0,
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9
  }.freeze

  class << self
    def part_one!
      calibrations = File.read(INPUT_PATH).split("\n")
      calibrations.sum do |calibration|
        digits = calibration.scan(/\d/)
        "#{digits[0]}#{digits[-1]}".to_i
      end
    end

    def part_two!
      calibrations = File.read(INPUT_PATH).split("\n")
      calibrations.sum do |calibration|
        digits = calibration.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
        digits.map! { |n| n.to_i.zero? ? WORD_TO_NUMBER[n] : n.to_i }
        "#{digits[0]}#{digits[-1]}".to_i
      end
    end
  end
end

puts Calibration.part_one!
puts Calibration.part_two!
