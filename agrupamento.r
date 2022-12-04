###AGRUPAMENTO###

###Hierarquico
data <- read.table("perfildeconsumo.csv", header = TRUE, sep=",")

min.max <- function(valor, min, max){
  valor_normalizado <- (valor - min(valor))/(max(valor) - min(valor))
  return(valor_normalizado)
}
data$frequencia <- min.max(data$frequencia, 0, 1)
data$consumo <- min.max(data$consumo, 0, 1)
#Matriz de similaridade dist(dados, metodo)
matrizSimilaridade <- dist(data, method = "euclidian")
#contruindo a hierarquia com hclust(), do pacote "stats"
#hclust(matriz_similaridade, metodo)
#metodo = single significa menor distancia, = complete significa maior distancia
#e = average significa distancia media
agrupamento <- hclust(matrizSimilaridade, method="single")
#visualizacao
plot(agrupamento, main = "Agrupamento Hierarquico Aglomerativo",
     xlab = "Clientes", ylab = "Distancias")
#Representar os grupos no dendograma
#rect.hclust(agrupamento, k, borda), borda eh a cor da linha
rect.hclust(agrupamento, k = 5, border = "red")

###K-Means
data <- read.table("globalsesAgrupamento.csv", header = TRUE, sep = ",")
data$ses <- min.max(data$ses,0,1)
data$gdppc <- min.max(data$gdppc,0,1)
data$yrseduc <- min.max(data$yrseduc,0,1)
#funcao kmeans() do pacote stats
#kmeans(dados, k, iteracoes)
status <- kmeans(data, 2, iter.max = 5)
perfis_ses <- status$cluster
#visualizando graficamente
install.packages("cluster")
library(cluster)
clusplot(data, perfis_ses, color=TRUE, lines = 0)

###Fuzzy C-Means
library("e1071")
statusFuzzy <- cmeans(data, 2)
statusFuzzy
#vendo graficamente
matplot(statusFuzzy$membership, type = "l", lty = 1, 
        xlab = "Exemplos", ylab = "Grau de pertinencia")




