module Labirintos (
    EstadoJogo(..),
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
data EstadoJogo = EstadoJogo { labirinto  :: [[Char]],
                               posInicial :: (Int,Int),
                               chavesAdq  :: String
                             } deriving (Show)

--Bia 
{-
recebe um labirinto válido e devolve o estado inicial do jogo nesse 
labirinto (no estado inicial, o jogador encontra-se na posição inicial, 
sem ter adquirido nenhuma chave).
-}
inicializa :: [String] -> EstadoJogo
inicializa lab = undefined

--Barrocas
{-recebe um estado de um jogo e devolve a posição atual do jogador.-}
jogador :: EstadoJogo -> (Int,Int)
jogador ej = undefined

--Bia
{-recebe um estado de um jogo e devolve a lista das chaves já adquiridas 
pelo jogador. Cada chave é representada por um dos caracteres 'a','b','c'.-}
chaves :: EstadoJogo -> String
chaves ej = undefined

--Barrocas
{-recebe um estado de um jogo e indica se o jogador já atingiu a 
posição final.-}
terminado :: EstadoJogo -> Bool
terminado ej = undefined

--Barrocas
{-que receba um estado de um jogo e uma sequência de movimentos, e 
devolva o estado do jogo resultante. Considere quatro movimentos 
possíveis: uma posição para cima (representado por 'u', ‘up’), uma 
posição para a esquerda (representado por 'l', ‘left’), uma posição
para a direita (representado por 'r', ‘right’) e uma posição para baixo 
(representado por 'd', ‘down’). Ao executar um movimento, deverá 
inspeccionar a posição destino. Consoante esta posição, a sua 
implementação deverá obedecer a certas regras, que passamos a explicar-}
move :: EstadoJogo -> String -> EstadoJogo
move ej str = undefined

