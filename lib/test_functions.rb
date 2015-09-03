module TestFunctions
  def TestFunctions.rastrigin(x)
    result = 10*x.size
    x.each do |cur|
      result += cur*cur - 10*Math.cos(Math::PI*2*cur)
    end
    return result
  end

  def TestFunctions.griewank(x)
    sum = 0
    multiplying = 1

    x.each.with_index do |xi,i|
      sum += xi*xi/4000
      multiplying *= Math.cos(xi/Math.sqrt(i+1))

    end
    return result= sum - multiplying + 1
  end

  def TestFunctions.levy(x)
    result = Math.sin(Math::PI * (1+(x[0]-1)/4)) * Math.sin(Math::PI * (1+(x[0]-1)/4))


    wd = 1 + (x[x.size-1] - 1)/4
    x.each do |xi|
      w = 1 + (xi -1)/4
      result += (w-1)*(w-1)*( 1+10*(Math.sin(Math::PI*w+1)*Math.sin(Math::PI*w+1) ) )
    end
    result += (wd-1)*(wd-1) * (1+ Math.sin(2*Math::PI*wd )*Math.sin(2*Math::PI*wd ) )
    return result
  end

  def TestFunctions.rosenbrock(x)
    result = 0
    (x.size-1).times do |i|
      result += (1-x[i])*(1-x[i]) + 100*(x[i+1] - x[i]*x[i])*(x[i+1] - x[i]*x[i])
    end
    return result
  end

  def TestFunctions.dixon_price(x)
    result = (x[0] - 1) * (x[0] - 1)

    x.each.with_index do |xi, i|
      result += (i+1) * (2* xi - x[i-1]) * ( 2* xi - x[i-1])  if i > 0
    end
    return result
  end

  def TestFunctions.three_hump(x)
     2*(x[0]**2) - (1.05 * x[0]**4) + (x[0]**6)/6 + x[0] * x[1] + x[1]**2
  end

  def TestFunctions.hyper_ellipsoid(x)
    result=0
    x.each.with_index do |xi, i|
      i.times do |j|
        result += x[j]**2
      end
    end
    return result
  end

  def TestFunctions.sphere(x)
    result=0
    x.each do |xi|
      result+=xi**2
    end
    return result
  end

  def TestFunctions.sum_squares(x)
    result=0
    x.each.with_index do |xi, i|
      result+= (i+1)*xi**2
    end
    return result
  end
end