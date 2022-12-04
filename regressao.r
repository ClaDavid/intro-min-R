###REGRESSAO###

#Regressao linear simples
data <- read.table("MinDadosR/regressaoSimplesLinear2.csv", header = TRUE, sep = ",")
plot(data$Empregados, data$Populacao)
#Utilizaremos a funcao lm(): modelo_linear <- lm(formula, dados)
x <- data$Empregados
y <- data$Populacao
modelo_linear <- lm(y~x, data)
modelo_linear
#O modelo pode ser utilizado na predicao, com predict()
#modelo_estimado <- predict(modelo_linear, exemplar_teste)
exemplar_teste <- data.frame(x=data[,2])
modelo_estimado <- predict(modelo_linear, exemplar_teste)
#Vendo graficamente
plot(x, y, xlab="Empregados", ylab="Populacao", type="p", col="blue", pch=1)
points(x, modelo_estimado, type = "p", col="red", pch = 16)
legend(locator(1), c("y", "modelo_estimado"), pch=c(1,16), col=c("blue", "red"))
#Executando novo teste
exemplar_teste <- data.frame(x = 72000)
modelo_estimado <- predict(modelo_linear, exemplar_teste)

#Regressao nao linear simples
#data <- read.table("MinDadosR/regressaoSimplesNLinear.csv", header = TRUE, sep = ",")
#plot(data$anuncios, data$produtosVendidos)
#Tambem eh utilizada a funcao lm(), mas sendo necessario aplicar a 
#funcao logaritmica sobre y
#x <- data$anuncios
#y <- data$produtosVendidos
#modelo_nao_linear <- lm(log(y)~x, data)
#modelo_estimado <- 163.59 * exp(3.416e-05*x)
#modelo_estimado_50 <- 163.59 * exp(3.416e-05*50)
#modelo_est <- 163.59*exp(3.416e-05*data[,2])
#visualizando graficamente
#plot(data$anuncios,data$produtosVendidos,xlab="Anuncio",ylab="Produto",
#     type="p",col="blue",pch=1,cex=1.5)
#points(x, modelo_estimado, type="p", col="red", pch=16)


