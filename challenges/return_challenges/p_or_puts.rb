def count_sheep
    5.times do |sheep|
      puts sheep
      if sheep >= 2
        return 
      end
    end
  end
  
  p count_sheep #p will return 0, 1, 2, nil because there is no return statememnt. 
  puts count_sheep #puts will return 0, 1, 2
