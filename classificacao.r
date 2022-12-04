###CLASSIFICACAO###

###KNN###
#Para utilizar o k-NN, sera utilizada a funcao knn(), disponivel no pacote class
#modelo_estimado <- knn(conjunto_treinamento, exemplar_teste, rotulos, k)
library("class")
data <- read.table("globalsesKNN.csv", header = TRUE, sep = ",")
summary(data)
str(data)
treinamento <- data[2:12, 1:3]
rotulos <- data[2:12, 4]
teste <- data[1, 1:3]
modelo_estimado <- knn(treinamento, teste, rotulos, 3)

###Arvore de decisao###
#Sera utilizado rpart() do pacote rpart, Recursive Partitioning and
#Regression Trees, responsavel pela parte de inducao do modelo
#A parte de predicao fica com a funcao predict()
#modelo_ad <- rpart(formula, dados, metodo, controle, parametros)
#modelo_estimado <- predict(modelo_ad, exemplares_teste, tipo)
library("rpart")
servico <- read.table("MinDadosR/servico.csv", header = TRUE, sep = ",")
data_treinamento <- servico[1:8, 1:4]
data_teste <- servico[9, 1:4]
#o uso do til (~): modelo estatistico, onde o que esta a esquerda dele eh
#a resposta e o que esta a direita dele sao as variaveis explanatorias.
#Traduzindo o que esta na formula:
#classe depende de ExpProfissionais, QualiRefeicao e LocalEstabelecimento
modelo_ad <- rpart(classe ~ ExpProfissionais + QualiRefeicao + 
                   LocalEstabelecimento, data = data_treinamento, method = "class",
                   control = rpart.control(minsplit = 1), 
                   parms = list(split = "Information"))
modelo_ad
#Explicando: 3) ExpProfissionais=POUCA 4 1 Prejuizo (0.2500000 0.7500000)
#sendo analisado no 3, com atributo ExpProfissionais=POUCA, com 4 1 indicando
#que existem 4 exemplares chegando ao no, e um deles nao pertence a classe 
#majoritaria Prejuizo. "*" indica nos folhas
#Para visualizar de forma grafica, utiliza rpart.plot()
#plot <- rpart.plot(modelo_ad, digitos, tipo)
install.packages("rpart.plot")
library("rpart.plot")
arvore <- rpart.plot(modelo_ad, type=3)
#Predizendo
modelo_estimado <- predict(modelo_ad, data_teste, type = "class")

###Naive Bayes
#data <- read.table("MinDadosR/planejamento.csv", header = TRUE, sep = ",")
#Para o Naive Bayes sera utilizado o pacote e1071
#install.packages("e1071")
#library("e1071")
#A funcao utilizada eh naiveBayes(dados_treinamento, rotulos)
#modelo_NB <- naiveBayes(data[1:4],data[,5])
#Para a predicao do modelo utiliza-se o predict()
#data_teste <- data.frame(previsao="sol",temperatura="frio",
#                         umidade="normal",vento="sim")
#modelo_estimado <- predict(modelo_NB, data_teste, type = "class")
#modelo_estimado <- predict(modelo_NB, data_teste, type = "raw")

#validacao
#pacote cvTools
install.packages("cvTools")
library("cvTools")
folds <- cvFolds(12, K = 4, type = "random")
folder_1 <- folds$subsets[which(folds$which == 1)]
data_folder_1 <- data[folds$subsets[which(folds$which == 1)], 1:3]
dataTrain <- data[folds$subsets[which(folds$which != 1)], 1:3]
dataRotulos <- data[folds$subsets[which(folds$which != 1)], 4]

modelo_estimado <- knn(dataTrain, data_folder_1, dataRotulos, 3)

