module Labirintos (
    EstadoJogo(..),
    inicializa,
    jogador,
    chaves,
    terminado,
    move
) where


data EstadoJogo = EstadoJogo { labirinto  :: [[Char]],
                               posicao    :: (Int,Int),
                               chavesAdq  :: String
                             } deriving (Show)

lab1 :: [String]
lab1 = ["*****","*S*F*","* * *","* *","*****"]
lab2 :: [String]
lab2 = ["*****","*S a*","*A***","* F*","*****"]
lab3 :: [String]
lab3 = ["*****","*S @*","*****","*F @*","*****"]
lab4 :: [String]
lab4 = ["*******","*c B S*","***** *","*a*F* *","*C*A* *","*b *","*******"]
lab5 :: [String]
lab5 = ["*******","* @ *","* ***B*","*a*S*F*","*** ***","*bA @*","*******"]

--Bia -done
{-recebe um labirinto válido e devolve o estado inicial do jogo nesse 
labirinto (no estado inicial, o jogador encontra-se na posição inicial, 
sem ter adquirido nenhuma chave).-}
inicializa :: [String] -> EstadoJogo
inicializa lab = EstadoJogo {labirinto = lab, posicao = posicaoInicial lab, chavesAdq = ""}

--Barrocas -TODO
posicaoInicial :: [String] -> (Int, Int)
posicaoInicial xs = undefined

--Barrocas -done
{-recebe um estado de um jogo e devolve a posição atual do jogador.-}
jogador :: EstadoJogo -> (Int,Int)
jogador = posicao

--Bia -done
{-recebe um estado de um jogo e devolve a lista das chaves já adquiridas 
pelo jogador. Cada chave é representada por um dos caracteres 'a','b','c'.-}
chaves :: EstadoJogo -> String
chaves = chavesAdq

--Barrocas -TODO
{-recebe um estado de um jogo e indica se o jogador já atingiu a 
posição final.-}
terminado :: EstadoJogo -> Bool
terminado ej = undefined

--Barrocas -TODO
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

