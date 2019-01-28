class OcrNumbers
  HASH = {
      " _ \n| |\n|_|\n   " => "0",
      "   \n  |\n  |\n   " => "1",
      " _ \n _|\n|_ \n   " => "2",
      " _ \n _|\n _|\n   " => "3",
      "   \n|_|\n  |\n   " => "4",
      " _ \n|_ \n _|\n   " => "5",
      " _ \n|_ \n|_|\n   " => "6",
      " _ \n  |\n  |\n   " => "7",
      " _ \n|_|\n|_|\n   " => "8",
      " _ \n|_|\n _|\n   " => "9",
  }
  def self.convert(input)
    input = input.split("\n")
    number_count = input[0].length / 3
    low_range = 0
    high_range = 2
    result = ''

    if input.length % 4 == 0 && input[0].length % 3 == 0
        number_count.times do
          storage_array = []
          input.each do |element|
              storage_array << element[low_range..high_range]
          end
          low_range += 3
          high_range += 3

          if HASH[storage_array.join("\n")] == nil
            result += "?"
          else
            result += HASH[storage_array.join("\n")]
          end
        end
        result
    else
      raise ArgumentError
    end
  end
end