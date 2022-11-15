module Labirintos (
    EstadoJogo(..),
    inicializa,
    jogador,
    chaves,
    terminado,
    move
) where


{-
Defina um tipo de dados EstadoJogo que permita representar o jogo de um
labirinto num dado momento. Neste jogo, o jogador tem como objetivo
chegar da posição inicial à posição final. 
Deverá ser possível obter informação de um objeto do tipo EstadoJogo 
das seguintes Formas:
-}
data EstadoJogo = EstadoJogo { labirinto  :: [String],
                               posicao    :: (Int,Int),
                               chavesAdq  :: String
                             } 

instance Show EstadoJogo where
    show :: EstadoJogo -> String
    show (EstadoJogo labirinto posicao chavesAdq) = unlines labirinto 
        


lab1 :: [String]
lab1 = ["*****","*S*F*","* * *","* *","*****"]
lab2 :: [String]
lab2 = ["*****","*S a*","*A***","* F*","*****"]
lab3 :: [String]
lab3 = ["*****","*S @*","*****","*F @*","*****"]
lab4 :: [String]
lab4 = ["*******","*c B S*","***** *","*a*F* *","*C*A* *","*b    *","*******"]
lab5 :: [String]
lab5 = ["*******","*  @  *","* ***B*","*a*S*F*","*** ***","*bA @*","*******"]


{-
recebe um labirinto válido e devolve o estado inicial do jogo nesse 
labirinto (no estado inicial, o jogador encontra-se na posição inicial, 
sem ter adquirido nenhuma chave).
-}
inicializa :: [String] -> EstadoJogo
inicializa lab = EstadoJogo {labirinto = lab, posicao = posIni lab, chavesAdq = ""}

posIni :: [String] -> (Int,Int)
posIni xs = posicaoInicial xs (length xs - 2)


posicaoInicial :: [String] -> Int -> (Int, Int)
posicaoInicial xs x
            |'S' `elem` (xs!!x) = (x, auxil (xs!!x) 'S')
            
auxil :: [Char] -> Char -> Int
auxil ys t = fst(head(filter(\(_,b) -> b == t) (zip [0..] ys)))




{-recebe um estado de um jogo e devolve a posição atual do jogador.-}
jogador :: EstadoJogo -> (Int,Int)
jogador = posicao


{-recebe um estado de um jogo e devolve a lista das chaves já adquiridas 
pelo jogador. Cada chave é representada por um dos caracteres 
'a','b','c'.-}
chaves :: EstadoJogo -> String
chaves = chavesAdq 

lab :: EstadoJogo -> [String]
lab = labirinto


{-recebe um estado de um jogo e indica se o jogador já atingiu a 
posição final.-}
terminado :: EstadoJogo -> Bool
terminado ej  | auxil2 (lab ej) (jogador ej) == 'F' = True
              | auxil2 (lab ej) (jogador ej) /= 'F' = False


--toma um par de coordenadas e devolve o valor no tabuleiro
auxil2 :: [String] -> (Int, Int) -> Char
auxil2 xs (a,b) = (xs!!a)!!b

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




