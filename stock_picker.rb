def stock_picker(stock_prices)
    diffs_sub = []
    diffs_master = []
  
    stock_prices.each_with_index do |price, day|
      i = day
      next_day = day + 1
      
      while next_day < stock_prices.length
        diff = stock_prices[next_day] - stock_prices[day]
        diffs_sub.push(diff)
        i += 1
        next_day += 1
      end 
  
      daily_max = diffs_sub.max
      highest_day = []
      
      if daily_max != nil
        highest_day.push(daily_max , ((day + 1) + (diffs_sub.find_index(daily_max)))) 
      end
  
      if highest_day.empty? == false
        diffs_master.push(highest_day)
      end
  
      diffs_sub.clear
    end
  
    best = [diffs_master.find_index(diffs_master.max), diffs_master.max[1], "for a profit of $#{diffs_master.max[0]}"]
  end
  
  prices = [100,1,600,9,11,8,6,9,1]
  
  p stock_picker(prices)