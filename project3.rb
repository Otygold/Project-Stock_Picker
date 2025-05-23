def stock_picker(prices)
    best_profit = 0
    best_days = [0, 0]
  
    # Loop through each day as the "buy" day
    prices.each_with_index do |buy_price, buy_day|
      # Loop through each possible "sell" day AFTER the buy day
      prices.each_with_index do |sell_price, sell_day|
        next if sell_day <= buy_day
  
        profit = sell_price - buy_price
  
        if profit > best_profit
          best_profit = profit
          best_days = [buy_day, sell_day]
        end

      end
    end
  
    best_days
  end
  
  puts "Enter stock prices separated by commas (e.g., 17,3,6,9,15,8,6,1,10):"
  input = gets.chomp
  prices = input.split(',').map(&:to_i)
  
  result = stock_picker(prices)
  puts "Best day to buy: Day #{result[0]}"
  puts "Best day to sell: Day #{result[1]}"
