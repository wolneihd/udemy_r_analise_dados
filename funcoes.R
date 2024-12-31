# Aula 19

maior = function(x, y) {
  if (x < y) {
    return (y)
  } else {
    return (x)
  }
}

x <- 10
y <- 8
resultado <- maior(x,y)
resultado

hipotenusa <- function(cat1, cat2) {
  return (sqrt(cat1^2 + cat2^2))
}

hipotenusa(4,3)