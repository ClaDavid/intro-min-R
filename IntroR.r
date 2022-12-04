###Mineracao de Dados aplicada a Economia utilizando a linguagem R###
##Clarissa David

##Explorando R

##Conceitos basicos##

1+2+3 #resposta: 6
1+2*3 #resposta: 7
(1+2)*3 #resposta: 9
2^5 #resposta: 32, potenciacao

#Intervalo
1:50 #resposta: intervalo de 1 ate 50

#Para limpar tela: ctrl+L ou COMMAND+OPTION+L

#Instalacao de pacote
install.packages("e1071") #instalacao
library("e1071") #carregar a biblioteca para o R
search() #mostra os pacotes disponiveis para uso
installed.packages() #busca mais especifica
help("e1071") #informacoes sobre o pacote


#Variaveis
#variavel eh definida pelo operador <-, que significa 'gets', 
#sendo uma atribuicao.
x <- 1 #atribuindo valor 1 a variavel x
x <- "R eh muito daora" #atribuindo conjunto de caracteres (string)
x <- 3.46 #atribuindo ponto flutuantes
x <- 1+2+3 

#Funcoes matematicas
sqrt(4) #raiz quadrada
exp(1) #exponencial
sum(1, 2, 3) #soma
sum(1:50) #soma de intervalos
cos(90) #cosseno
log(9, 3) #primeiro argumento: valor, segundo argumento: base
x <- sum(sum(1, 2, 3), 4) 

#Tipos de dados
class(x) #resp: numeric
is.character(x) #resp: false
is.numeric(x) #resp: true
x <- "caracter "
is.character(x) #resp: true
nchar(x) #num de caracteres, contando inclusive espacos, pontuacoes etc

#Vetores
#Varias formas de criar um vetor
vetor <- 1:10
vetor <- seq(1, 10, 2) #seq(valor inicial, valor final, intervalo entre os valores)
vetor <- rep(1,5) #repete valores, rep(valor, quantidade de repeticoes)
vetor <- rep(1:5, 3)
vetor <- runif(5, 1, 10) #valores aleatorios, runif(quantidade de numeros, valor inicial, valor final)
vetor <- sample(1:10, 5) #valores aleatorios, sample(intervalo, quantidade)
vetor <- sample(1:10, 5, replace = T) #valores aleatorios e com repeticao 
vetor <- rnorm(5, 4, 1) #distribuicao normal, rnorm(quantidade de numeros, valor medio, desvio da distribuicao normal)
vetor <- c(9, 5, 11, 100, 21) #formato usualmente utilizado, c de concatenacao
vetor[1] #primeiro valor do vetor, atencao, o indice comeca do 1
#Algumas funcoes com vetor
min(vetor)
max(vetor)
range(vetor)
sort(vetor)
rank(vetor)
order(vetor)
order(vetor, decreasing=TRUE)
length(vetor)
sum(vetor)
mean(vetor)
median(vetor)
var(vetor)
quantile(vetor)
#Vetor com strings
cardapio <- c("File a parmegiana", "Feijoada", "Batata", "Pudim")
cardapio[3]
nchar(cardapio)
length(cardapio)
sort(cardapio)

#Data frames
precos <- c(32.50, 22.00, 8.50, 5.00)
#suponha que queremos associar cardapio com os precos, em uma tabela
menu <- data.frame(Cardapio = cardapio, Valores = precos)

#Listas
#Possibilita relacionamento de vetores de diferentes tipos
#Com possibilidade de concatenar elementos de diferentes tamanhos
num1 <- c(5, 3, 7, 4)
num2 <- c(4, 1, 4, 4)
numeros <- list(num1, num2)
list(cardapio, precos, numeros)

#Matrizes
matriz <- matrix(1:10, nrow = 5) #matrix(valores, numero de linhas)
matriz[3,2] #resp: 8
t(matriz) #transposta de uma matriz

#Arrays = vetor multidimensional
arr <- array(1:12, dim = c(2, 3, 2)) #2 linhas, 3 colunas, 2 dimensoes
arr[2,1,2] #linha, coluna, dimensao

#Trabalhando com vetores
#Produto interno
vet1 <- c(1, 2, 3)
vet2 <- c(3, 2, 1)
res <- 0
for(i in 1:length(vet1)){
  res <- res + vet1[i]*vet2[i]
}
print(res)
#For pode ser caro computacionalmente:
res <- sum(vet1*vet2)
res = vet1%*%vet2
mat1 <- matrix(c(2, 8, 3, 2), nrow=2)
mat2 <- matrix(c(9,7,5,10,1,3),nrow=2)
mat1%*%mat2
#Multiplicar um vetor por uma matriz
mat1[1,]%*%mat2
#Transformacoes de vetores em matrizes
combinado <- rbind(vet1, vet2)
combinado2 <- cbind(vet1, vet2)
cor(vet1, vet2) #correlacao
dist(combinado) #distancia euclidiana entre vetores

#Importando dados de arquivos
iris <- read.table("MinDadosR/iris.csv", header = TRUE, sep=",")
iris <- read.table("MinDadosR/iris.csv", header = FALSE, sep=",")

#Graficos
x <- iris[,"sepal_width"]
y <- iris[,"petal_width"]

#Grafico de dispersao
plot(x, y, type="p", main = "Planta Iris", xlab = "Sepal Width", ylab = "Petal Width")
points(x[1:50], y[1:50], col="2", cex=2,pch=19)
points(x[51:100], y[51:100], col="3", cex=2,pch=1)
points(x[101:150], y[101:150], col="4", cex=2,pch=19)
legend(locator(1),c("setosa","versicolor","virginica"), pch=c(19, 1, 19), col=c(2,3,4), cex=1.8)

#Grafico de linhas
plot(x, type="n",xlab="indice",ylab="Sepal Width")
lines(iris["sepal_width"])
plot(x,type="n",xlab="indice",ylab="Species",ylim=c(0,4))
lines(iris["species"])

#Grafico de barras
quantidade <- tapply(rep(1,150),iris["species"],sum)
barplot(quantidade,xlab="Especies",ylab="Frequencia")

#Grafico de setores
pie(quantidade)

#Grafico de caixas (boxplot)
summary(iris)
boxplot(iris[1:4])

#Histograma
hist(t(iris["petal_width"]),main="Histograma de Petal Width separado em faixas",
     xlab="Petal Width", 5, ylab="Frequencia")
