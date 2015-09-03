require_relative 'optimalization_properties'
require_relative 'opposite_numbers'

##
# == Implementacja algorutmu evolucji różnicowej rozszerzonego o zastosowanie wektorów przeciwnych z samoadaptującym się współczynnikiem JR
module AODE
  include OptimalizationProperties
   
 
  # Funkcja uruchamiająca algorytm AODE  
  def AODE.run(&function)
    rand = Random.new()
    results = Array.new
    function_calls = 0
    current_min=0
    jr = JR


    # Inicjalizacja
    x = Array.new
    ox = Array.new
    
    POPULATION_COUNT.times do
      tab = []
      DIMENSION.times{ tab << rand.rand()*MAX + MIN }
      x << Vector[*tab]
      ox << OppositeNumbers::opposite(MAX, MIN, x.last)

      function_calls += 2
    end
    x = x+ox
    x.sort_by!{|x| function.call(x)}
    x= x[0..POPULATION_COUNT]


    iterations = 0
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



      # Generacja wektorów przeciwnych
      if(rand.rand < jr)

        ox = OppositeNumbers::opposite_population(x)
        x = x + ox
        x.sort_by!{|x| function.call(x)}
        x= x[0..POPULATION_COUNT]
        grow_factor = (x & ox).length


        function_calls += 2*POPULATION_COUNT

        jr = 0.9*grow_factor/POPULATION_COUNT
        jr = 0.1 if jr < 0.1


        iterations += 1
        current_min = x.min_by {|xi| function.call(xi)}
        current_min = function.call(current_min)
        results[iterations] = current_min

      end
      

      iterations += 1
    end while current_min > VTR  and  function_calls < MAX_FUNCTION_CALLS



    if function_calls < MAX_FUNCTION_CALLS
      succes = true
    else
      succes = false
    end

    data = {iteracje: iterations, succes: succes, results: results, nfc: function_calls }
    return data
  end
end