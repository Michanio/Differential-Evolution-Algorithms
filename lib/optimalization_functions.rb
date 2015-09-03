require_relative 'de.rb'
require_relative 'ode.rb'
require_relative 'aode.rb'

module OptimalizationFunctions
  def differential_evolution(&function)
    DE::run { |current| function.call(current) }
  end
  
  def opposite_based_differential_evolution(&function)
    ODE::run { |current| function.call(current) }
  end
  
  def adaptative_opposite_based_differential_evolution(&function)
    AODE::run { |current| function.call(current) }
  end
end