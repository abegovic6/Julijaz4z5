#=
zadatak4:
- Julia version: 
- Author: Amila Begovic
- Date: 2024-06-23
=#

import Pkg; Pkg.add("Distributions");
using Distributions

function ravan(x, y, z)
  return  x + y + z
end

function JeLiTackaUnutarElipsoida(x, y, z, a, b, c)
    return (x/a)^2 + (y/b)^2 + (z/c)^2 <= 1
end

function jeLiTackaIzmedjuRavni(x, y, z, k, l, max)
  ravanS = ravan(x, y, z)
  while 2 * k * l * sqrt(3) < max
    r1 = ravanS - k * 2 * l * sqrt(3)
    r2 = r1 - l * sqrt(3)
    r12 = ravanS + k * 2 * l * sqrt(3)
    r22 =  r12 + l * sqrt(3)
    if (abs(r1) <= l * sqrt(3) && abs(r2) <= l * sqrt(3)) ||  (abs(r12) <= l * sqrt(3) && abs(r22) <= l * sqrt(3))
      return true
    end
    k = k + 1
  end
  return false
end

function volumen()
  a = 13.9
  b = 15
  c = 17
  l = 0.28
  V_kvadra = 8 * a * b * c
  N = [1000, 5000, 10000]
  maxCoord = 1.5 * max(a, b, c)
  for i=1:3
    n = N[i]
    xdata = rand(Uniform(-a,a), 1,n)
    ydata = rand(Uniform(-b,b), 1,n)
    zdata = rand(Uniform(-c,c), 1,n)
    brojTacakaUnutarTrazeneZapremine = 0
    for j=1:n
      if JeLiTackaUnutarElipsoida(xdata[j], ydata[j], zdata[j], a, b, c) && jeLiTackaIzmedjuRavni(xdata[j], ydata[j], zdata[j], 0, l, maxCoord)
        brojTacakaUnutarTrazeneZapremine = brojTacakaUnutarTrazeneZapremine + 1
      end
    end

    V = brojTacakaUnutarTrazeneZapremine / n * V_kvadra

    print("Broj tacaka: ", n)
    println(" Zapremina: ", V)
  end
end

for i=1:5
  print("Poziv broj ", i)
  println()
  volumen()
end
