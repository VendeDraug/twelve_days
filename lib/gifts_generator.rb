class GiftsGenerator
  attr_reader :custom_order

  def initialize(custom_order)
    @custom_order = custom_order
    @gifts = gifts
  end

  def call
    custom_order.each do |k, v|
      day = k.to_s
      index = day.to_f - 1
      @gifts[index] = @gifts[index].gsub(/\s.+\z/, " #{v}")
    end
    @gifts
  end

  private

  def gifts
    [
      "A partridge in a pear tree",
      "Two turtle doves",
      "Three French hens",
      "Four calling birds",
      "Five golden rings",
      "Six geese a-laying",
      "Seven swans a-swimming",
      "Eight maids a-milking",
      "Nine ladies dancing",
      "Ten lords a-leaping",
      "Eleven pipers piping",
      "Twelve drummers drumming"
    ]
  end
end