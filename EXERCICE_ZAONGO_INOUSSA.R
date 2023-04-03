#cours_004_Manipulation de données :les bases
#Importation de données
#Type CSV
chemin="C:/Users/LENOVO/Desktop/ISEP2_Année_Scolaire_2022_2023/SEMESTRE 4/Informatique_4/Programmation_R/cours/cours_R_2023"
File=paste0(chemin,"/cours_004_base.csv")
Base<-read.csv2(File)
View(Base)

#type text
mydata<-read.table("C:/Users/LENOVO/Desktop/ISEP2_Année_Scolaire_2022_2023/SEMESTRE 4/Informatique_4/Programmation_R/cours/cours_2023_R/cours_R/cours_004_base",header =TRUE )
mydata

#type classeur excel
library(readxl)
data<-read_xlsx("C:/Users/LENOVO/Desktop/ISEP2_Année_Scolaire_2022_2023/SEMESTRE 4/Informatique_4/Programmation_R/cours/cours_R_2023/cours_004_base.xlsx")
View(data)

#selection de variable
age <-data$Age

#Filtrage de données
#filtrer les individus agé de moins de 30 ans
teenager<-data[data$Age<30,]
View(teenager)
 #agregation de donné
moyenne_age_par_region <-aggregate(data$Age, by =list(data$Region),FUN=mean)
View(moyenne_age_par_region)

#Fusion de base de donnée
data_menage <- merge(data, menage, by = "id_client")

#statistique descriptive
moyenne_age <- mean(data$Age)
moyenne_age
ecart_type<-sd(data$Age)
print(ecart_type)
sum(data$Note)

#Manipulation de donnée:ça ne marche pas
individu_old_rev<-data %>% 
  filter(Age>30,Revenu>300000) 
View(individu_jeune_rev)

#histogramme de l'age des individu
installed.packages("ggplot2")
ggplot(data,aes(x=Age))+ geom_histogram()
ggplot(data,aes(x==Age))+geom_histogram()

# Diagramme en barres de
#il faut creer des classe d'age pour pouvoir construire le diagramme en barre

data$classe_age <- cut(data$Age, breaks = c(0, 20, 40, 60,80, Inf), labels = c("0-20", "21-40", "41-60", "61-80","80+"))
data
ggplot(data,aes(x=classe_age))+geom_bar()

## Nuage de points de l'âge par rapport au revenu

ggplot(data,aes(x=Age,y=Revenu))+geom_point()

# Graphique en boîtes de l'âge par rapport à la région
ggplot(data,aes(x=Region,y=Age))+geom_boxplot()

#Exportation de données
write.csv(carte_termique,"carte_termique.csv", row.names = FALSE)

#Visualisation de données
# Créer un vecteur de données
note<-data$Note

# Créer l'histogramme
hist(note, col="green",main = "Histogramme des notes", xlab = "Valeurs", ylab = "Fréquence")
mean(note)

#Créer le diagramme en boîtes
boxplot(note,main="boite à moustache",ylab="valeurs")

#Nuage de points

#Créer le nuage de points
age=data$Age

plot(note,age,main="nuage de point",xlab="note",ylab="age")
#Graphique en barres
nom=data$Nom
barplot(note, names.arg = nom, main = "Graphique en barres des notes ", xlab = "nom", ylab = "notes")
#Créer le graphique en secteurs
revenu=data$Revenu
pie(revenu, labels = nom, main = "Graphique en secteurs des revenu")


#faisons la carte termique
#extraire une matrice de la base

carte_termique=subset(data,select=c("Age","Note","Revenu"))
View(carte_termique)
#mais comme le type est list on ne peut pas effectuer l'operation
typeof(carte_termique)

#transformation de carte_termique en matrice
carte_termic=as.matrix(carte_termique) 

heatmap(carte_termic,main="carte termique")

