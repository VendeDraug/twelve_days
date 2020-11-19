require_relative 'gifts_generator'

class TwelveDays
  attr_reader :gifts

  def initialize(gifts = {})
    @gifts = GiftsGenerator.new(gifts).call
  end

  ORDINATES = [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth", 
    "tenth",
    "eleventh",
    "twelvth"
  ].freeze

  def song
    verses(1, 12)
  end

  def verses(lower, upper)
    lower.upto(upper).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    "On the #{ordinalize(number)} day of Christmas my true love sent to me\n" + 
    number.downto(2).collect { |i| line(i) }.join("\n") +
    connector(number) +
    line(1) + 
     ".\n"
  end

  def line(number)
    gifts[number - 1]
  end

  private

  def ordinalize(number)
    ORDINATES[number - 1]
  end

  def connector(number)
    case number
    when 1
      ""
    else
      ", and\n"
    end
  end
end