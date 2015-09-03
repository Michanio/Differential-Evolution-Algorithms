require 'matrix'

##
# === Parametry wejściowe wywołania algorytmu ewolucji różnicowej
# DIMENSION::  definiuje w ilu wymiarach rozpatrywana ma być przekazana funkcja
# [POPULATION_COUNT] ustala rozmiar populacji przeszukującej zbiór rozwiązań
# [F] współczynnik skalowania podczas mutacji
# [CR] prawdobodobieństwo krzyżowania
# [MAX] górna granica rozpatrymanej przestrzeni rozwiązań
# [MIN]  dolna granica rozpatrywanej przestrzeni rozwiązań
# [JR]  prawdopodobieństwo wystąpienie zjawiska generowanie populacji przeciwnej w algorytmie ODE i AODE
# [VTR]  wartość oczekiwana poniżej której algorytm przery pracę
# [MAX_FUNCTION_CALLS]  maksymalna liczba wywołań funkcji
#
module OptimalizationProperties
  DIMENSION = 10
  POPULATION_COUNT = 100
  F = 0.5
  CR = 0.9
  MAX = 600
  MIN = -600
  JR = 0.3
  VTR = 1.0e-8
  MAX_FUNCTION_CALLS = 1.0e+6
end