puts 512.times.flat_map{|i|[n=i^i>>1,n^1023]}.rotate.map{|e|"%010b"%e}