require_relative 'optimalization_functions.rb'
require_relative 'test_functions.rb'

include OptimalizationFunctions



data_de = differential_evolution {|current| TestFunctions::sphere(current) }
data_ode = opposite_based_differential_evolution {|current| TestFunctions::sphere(current) }
data_aode = adaptative_opposite_based_differential_evolution {|current| TestFunctions::sphere(current) }

p data_de[:results].last
p data_ode[:results].last
p data_aode[:results].last
