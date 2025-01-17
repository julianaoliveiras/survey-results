#AJUSTE DOS DADOS
dados[1:2] <- lapply(dados[ 1:2], function(x){ factor(x, 
                                                           levels = c("1", "2", "3", "4", "5"),                                  
                                                           labels = c("FRACO", "MODERADO", "SATISFAT�RIO", "MUITO BOM", "EXCELENTE"))})

names(dados)[1:2] <- paste(names(dados)[1:2], itens$texto, sep="_")


#install.packages("likert")
library(likert)
lik <- likert(as.data.frame(dados[1:2]))

# Op��o 1
plot(lik, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="5"))

# Op��o 2
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="5"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 5:8]), grouping = dados$categ)
plot(lik2, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="6"))