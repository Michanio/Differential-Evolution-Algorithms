module OppositeNumbers
  ##
  # Funkja wyznaczająca wektor przeciwny do przekazanego w parametrach wywołania
  #
  # Parametry: 
  # +max+:: górna granica rozpatrywanej przestrzeni (liniowej)
  # +min+:: dolna granica rozpatrywanej przestrzeni
  # +vector+:: wektor względem którego wyznaczany jest wektor przeciwny
  #
  def OppositeNumbers.opposite(max, min, vector)
    x = vector.collect{|v| max+min-v}
    return Vector[*x]
  end


  ##
  # Funkja wyznaczająca kolekcje wektorów przeciwnych względem przekazanej w parametrach wywołania
  #
  # Parametry: 
  # population:: tablica wektorów
  #
  def OppositeNumbers.opposite_population(population)

    values_in_dimension = []
    dimension = population[0].size

    dimension.times{|i| values_in_dimension[i] = []}

    #Znalezienie MAX i MIN zakresu w każdej przestrzeni
    population.each do |x|
      x.each.with_index do |xi, index|
        values_in_dimension[index] << xi
      end
    end
    dimension.times{ |i| values_in_dimension[i].sort!}

    opposite_population = population.collect do |x|
      ox_tab = []
      x.each.with_index{|xi, index| ox_tab[index] = values_in_dimension[index].first + values_in_dimension[index].last - xi}
      Vector[*ox_tab]
    end
  end
  
end