# Cas d'utilisations

<!--

Scénario : Les étudiants ayant pour cours le piano et batterie n'ont pas besoin d'avoir d'instruments.
Également, un étudiant peut être dans le système dans instrument, mais doit avoir son instrument pour le début des cours. 


Scénario : Un cours de musique peut ne pas avoir d'élève attribué (car il est en attente). Un cours de musique doit avoir un ou des élèves pour avoir lieu.  

-->

```plantuml

left to right direction
actor Boxeur as a1
actor Entraineur as a2
actor Analyste as a3


a2 <|- a3
a1 <|- a2



package Application_Combat_Boxe {
  usecase "CreerCombat" as UC1
  usecase "ModifierCombat" as UC2
  usecase "ModifierRound" as UC3
  usecase "ConsulterCombat" as UC4
  usecase "VoirSommaire" as UC5
}

a3 --> UC1
a3 --> UC2
a3 --> UC3
a2 --> UC4
a1 --> UC5

```
