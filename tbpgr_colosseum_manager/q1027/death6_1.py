print(':'.join(str(i)for i in range(2,999)if all(i%j for j in range(2,i))))