module Labirintos (
    EstadoJogo,
    inicializa,
    jogador,
    chaves,
    terminado,
    move
) where

{-

lab4 = ["*******","*c B S*","***** *","*a*F* *",
"*C*A* *","*b *","*******"]

Defina um tipo de dados EstadoJogo que permita representar o jogo de um
labirinto num dado momento. Neste jogo, o jogador tem como objetivo
chegar da posição inicial à posição final. 
Deverá ser possível obter informação de um objeto do tipo EstadoJogo 
das seguintes Formas:
-}
newtype EstadoJogo = Lab [[Char]] deriving (Show)

--Bia 
inicializa :: [String] -> EstadoJogo
inicializa lab = undefined

--Barrocas
jogador :: EstadoJogo -> (Int,Int)
jogador ej = undefined

--Bia
chaves :: EstadoJogo -> String
chaves ej = undefined

--Barrocas
terminado :: EstadoJogo -> Bool
terminado ej = undefined

--Barrocas
move :: EstadoJogo -> String -> EstadoJogo
move ej str = undefined


