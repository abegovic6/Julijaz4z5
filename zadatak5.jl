#=
zadatak5:
- Julia version: 
- Author: Amila Begovic
- Date: 2024-06-23
=#

function paramteri_sistema(mi, lambda, s)
  #mi - intenzitet usluzivanja
  #lambda - intenzitet dolaska
  if s == 1
    ro = lambda/mi
    L = ro / (1 - ro)
    Lq = lambda^2 / (mi*(mi - lambda))
    W = L / lambda
    Wq = Lq / lambda
  else
    ro = lambda / (s * mi)
    sum = 1
    for n=1:s-1
      sum = sum + 1/(factorial(n)) * (lambda/mi)^n
    end
    sum = sum +  + 1/(factorial(s)) * ((lambda/mi)^s) * s * mi / (s * mi - lambda)
    P0 = 1 / sum
    Lq = P0 * ro  / (factorial(s) * (1-ro)^2) * (lambda/mi)^s
    Wq = Lq/lambda
    W = Wq + 1/mi
    L = Lq + lambda/mi
  end
   println("Broj šaltera: ", s)
    println("Iskorištenost sistema: ", ro)
    println("Očekivani broj korisnika u sistemu: ", L)
    println("Očekivani broj korisnika u redu za čekanje: ", Lq)
    println("Prosječno vrijeme korisnika u sistemu: ", W)
    println("Prosječno vrijeme korisnika u redu za čekanje: ", Wq)
end

paramteri_sistema(6,10,2)
paramteri_sistema(6,10,3)
paramteri_sistema(6,28,5)
paramteri_sistema(6,28,6)
for i = 10:15
  paramteri_sistema(6,73,i)
end
for i = 8:13
  paramteri_sistema(6,45,i)
end