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


newtype EstadoJogo = E([String],(Int,Int),String)


instance Show EstadoJogo where
    show :: EstadoJogo -> String
    show (E(lab, posicao, chavesAdq))  = unlines lab ++ "chaves: " ++ chavesAdq
         
        


lab1 :: [String]
lab1 = ["*****","*S*F*","* * *","*   *","*****"]
lab2 :: [String]
lab2 = ["*****","*S a*","*A***","*  F*","*****"]
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
inicializa lab = E (lab,  posicaoInicial lab, "")

posicaoInicial:: [String] -> (Int,Int)
posicaoInicial n = (apanhaLinha n , auxiliarColuna n -1) 

apanhaLinha:: [String] -> Int
apanhaLinha n = head([a | (a,b) <- zip [0,1..] n, estaNaString b 'S'])

apanhaCoord:: (Num a) => String -> a
apanhaCoord [] = 0
apanhaCoord (x:xs) 
   | x == 'S'      = 1
   | otherwise     = 1 + apanhaCoord xs

estaNaString:: String -> Char -> Bool
estaNaString [] _ = False
estaNaString (x:xs) c
   | x == c      = True
   | otherwise     = estaNaString (xs) c

auxiliarColuna:: (Num a) => [String] -> a
auxiliarColuna [] = 0
auxiliarColuna (x:xs)  
   | estaNaString x 'S'  = apanhaCoord x
   | otherwise           = auxiliarColuna xs




{-recebe um estado de um jogo e devolve a posição atual do jogador.-}
jogador :: EstadoJogo -> (Int,Int)
jogador (E(x,y,z)) = y

{-recebe um estado de um jogo e devolve a lista das chaves já adquiridas 
pelo jogador. Cada chave é representada por um dos caracteres 
'a','b','c'.-}
chaves :: EstadoJogo -> String
chaves (E(x,y,z)) = z 

lab :: EstadoJogo -> [String]
lab (E(x,y,z)) = x


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
possíveis: uma posição para cima ('u' = ‘up’), uma posição para a 
esquerda ('l' = ‘left’), uma posição para a direita ('r' = ‘right’)
e uma posição para baixo ('d' = ‘down’). Ao executar um movimento,
deverá inspeccionar a posição destino. Consoante esta posição, a sua 
implementação deverá obedecer a certas regras, que passamos a explicar:
    ->Se a posição destino for um espaço em branco, ' ', o jogador
pode mover-se, passando a ocupar essa posição;
    ->Se a posição destino for uma parede, '*', o jogador não pode 
mover-se, pelo que o estado do jogo mantém-se igual.
    ->Se a posição destino for a posição inicial, 'S', o jogador pode 
mover-se, passando a ocupar essa posição. Ou seja, a posição inicial 
funciona como um espaço em branco. No exemplo abaixo o jogador move-se 
uma posição para baixo e uma posição para cima, voltando à posição 
inicial.
    ->Se a posição destino for a posição final, 'F', o jogador pode 
mover-se, passando a ocupar essa posição. Ao atingir esta posição, a 
função terminado deve retornar True.
    ->Se a posição destino for uma chave, 'a','b','c', o jogador pode 
mover-se, passando a ocupar essa posição. A chave é recolhida pelo 
jogador: deve ser removida do labirinto e acrescentada à lista de chaves.
    ->Se a posição destino for uma porta, 'A','B','C', e se a chave 
respetivaa inda não tiver sido coleccionada, o jogador não pode mover-se, 
pelo que o estado do jogo mantém-se igual. Ou seja, nestas situações a 
porta funciona como uma parede.
    ->Se a posição destino for uma porta, 'A','B','C', e se a chave 
respetiva já tiver sido coleccionada, o jogador pode mover-se, passando 
a ocupar essa posição. A porta é aberta, e deve ser removida do 
labirinto. O jogador não perde a chave após abrir a porta.
    ->Recorde que num labirinto válido existem exatamente zero ou dois 
portais. Se a posição destino for um portal, '@', o jogador pode 
mover-se, passando a ocupar a posição do outro portal no labirinto.

Foi o stor que disse String?
-} 

move :: EstadoJogo -> String -> EstadoJogo
move e [] = e
move (E(lab,pos,keys)) (x:xs)
    |  (auxiliarMovimentoBool lab pos x) == False   = move (E(lab,pos,keys)) xs
    |  (auxiliarMovimentoBool lab pos x) == True    = move (moverJogador(E(lab,pos,keys)) x) xs
    


--Função que move realmente o jogador
moverJogador:: EstadoJogo -> Char -> EstadoJogo
moverJogador (E(lab,pos,keys)) x
    | x == 'u' = E(lab,auxiliarPosicao (0,-1) pos,keys)
    | x == 'd' = E(lab,auxiliarPosicao (0,1) pos,keys)  
    | x == 'l' = E(lab,auxiliarPosicao (-1,0) pos,keys)  
    | x == 'r' = E(lab,auxiliarPosicao (1,0) pos,keys) 

auxiliarPosicao:: (Int,Int) -> (Int,Int) -> (Int,Int) 
auxiliarPosicao (a,b) (c,d) = (a+c,b+d) 


--devolve a posicao no tab acima, abaixo, esq ou dir
auxiliarMovimentoBool :: [String] -> (Int,Int) -> Char -> Bool
auxiliarMovimentoBool lab (x,y) w   
    | w == 'u' && auxil2 lab (x+0, y+1) /=  '*'  = True
    | w == 'd' && auxil2 lab (x+0, y-1) /=  '*'  = True
    | w == 'l' && auxil2 lab (x-1, y+0) /=  '*'  = True
    | w == 'r' && auxil2 lab (x+1, y+0) /=  '*'  = True
    | otherwise =  False
