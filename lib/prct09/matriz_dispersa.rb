# Files:       1

# Classes:     1 (0 undocumented)
# Modules:     1 (0 undocumented)
# Constants:   0 (0 undocumented)
# Attributes:  0 (0 undocumented)
# Methods:    10 (2 undocumented)

# Total:      12 (2 undocumented)
# 83.33% documented


require "./lib/prct09/matriz.rb"
require "./lib/prct09/matriz_densa.rb"

module Prct09
  class Matriz_Dispersa < Matriz

    def new_initialize
      @pos = Array.new(@filas)
      @filas.times do |i|
        @pos[i] = {} 
      end
    end

    def initialize(filas, columnas)
      super
      new_initialize
    end


  # Metodo Creacion de la matriz dispersa
    def self.copy(matriz)

    obj = new(matriz.filas, matriz.columnas)

    matriz.filas.times do |i|
      matriz.columnas.times do |j|
        val = matriz.get(i,j)
        if(val != 0)
          obj.pos[i][j] = val
        end
      end
    end
    obj
    end

 # Get (Devuelve el valor del elemento guardado en i,j)
    def get(i, j)
      if(@pos[i][j] != nil)
        return @pos[i][j]
      else
        return 0
      end
    end
 # Set (Modifica el valor del elemento guardado en i,j)

    def set(i, j, val)
      if(val == nil or val == 0)
        @pos[i].delete(j)
      else
        @pos[i][j] = val
      end
    end

# Porcentaje de numeros nulos

     def num_nulos
       t = @filas*@columnas
       nn = 0
         
       @filas.times do |i|
         nn += @pos[i].size
         i += 1
       end

       n = t - nn
       n.to_f/t.to_f
     end

#Definicion del metodo to_s  

def to_s
      output = ""
      @filas.times do |i|
        output += "Fila #{i}: "
        @pos[i].sort.each{|k, v| output += "#{k}=>#{v} "}
        output += "\n"
      end
      output
    end

#Metodo Suma

def +(other)
      c = Matriz_Densa.new(@filas, @columnas)
      @filas.times do |i|
        @columnas.times do |j|
#      i = 0
#      while(i < @filas)
#        j = 0
#        while(j < @columnas)
          c.set(i, j, get(i,j) + other.get(i,j))
#          j += 1
        end
#      i += 1
      end

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Resta

    def -(other)
      c = Matriz_Densa.new(@filas, @columnas)
      @filas.times do |i|
        @columnas.times do |j|
#      i = 0
#      while(i < @filas)
#        j = 0
#        while(j < @columnas)
          c.set(i, j, get(i,j) - other.get(i,j))
#          j += 1
        end
#        i += 1
      end

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Multiplicacion

    def *(other)
      c = Matriz_Densa.new(@filas, other.columnas)
      @filas.times do |i|
        other.columnas.times do |j|
          @columnas.times do |k|
#      i = 0
#      while(i < @filas)
#        j = 0
#        while(j < other.columnas)
#        k = 0
#        while(k < @columnas)
          c.set(i, j, get(i, k) * other.get(k,j) + c.get(i,j))
#          k += 1
        end
#        j += 1
      end
#      i += 1
    end 

    if(c.num_nulos > 0.6)
      c = Matriz_Dispersa.copy(c)
    end
    c
    end
 
 end
end


