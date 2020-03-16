      begin
        1 / 0
      rescue Exception => e
        puts "ERROR_" + e.class
      end

