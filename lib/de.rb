require_relative 'optimalization_properties.rb'
require 'matrix'

module DE
  include OptimalizationProperties
  
  def DE.run(&function)
    raise "Block must be given, and contain test function" unless block_given?
    
    rand = Random.new()
    results = Array.new
    
    #Inicjalizacja
    x = Array.new
    POPULATION_COUNT.times do |i|
      temp = Array.new
      DIMENSION.times{ |j| temp << rand.rand()*MAX + MIN }
      x << Vector[*temp]
    end


    
    # Wykonuje algorytm do mmentu spełnienia waruków wyjścia ##
    iterations = 0
    function_calls = 0
    begin
      
      # Mutacja
      v = x.collect do |current|
        begin x1 = rand.rand(POPULATION_COUNT) end while x[x1] == current
        begin x2 = rand.rand(POPULATION_COUNT) end while x[x2] == current or x[x2] == x[x1]
        begin x3 = rand.rand(POPULATION_COUNT) end while x[x3] == current or x[x3] == x[x2] or x[x3] == x[x1]
        x[x1] + (x[x2]-x[x3])*F
      end

      u = []
      tempU = []

      # Rekombinacja
      POPULATION_COUNT.times do |i|
        k = rand.rand(DIMENSION)

        DIMENSION.times do |j|
          if rand.rand() < CR or j == k
            tempU[j] = v[i][j]
          else
            tempU[j] = x[i][j]
          end
        end
        u << Vector[*tempU]

        if function.call(x[i]) > function.call(u[i])
          x[i] = u[i]
        end
        function_calls+=2
      end


      current_min = x.min_by {|xi| function.call(xi)}
      current_min = function.call(current_min)
      results[iterations] = current_min



      iterations += 1

    end while current_min > VTR  and  function_calls < MAX_FUNCTION_CALLS


    if function_calls < MAX_FUNCTION_CALLS
      succes = true
    else
      succes = false
    end

    data = {iterations: iterations, succes: succes, results: results, function_calls: function_calls }
    return data
  end
end