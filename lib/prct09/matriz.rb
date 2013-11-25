# Files:      1

# Classes:    1 (0 undocumented)
# Modules:    1 (0 undocumented)
# Constants:  0 (0 undocumented)
# Attributes: 3 (3 undocumented)
# Methods:    1 (1 undocumented)

# Total:      6 (4 undocumented)
# 33.33% documented


require './lib/prct09/racional.rb'

module Prct09
  class Matriz
    attr_reader :filas, :columnas
    attr_accessor :pos

    def initialize(filas, columnas)
      @filas=filas
      @columnas=columnas
    end

  end
end

