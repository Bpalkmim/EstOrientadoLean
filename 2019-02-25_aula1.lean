-- Matéria de estudo orientado de L∃∀N com o Hermann
-- 2019.1
-- autor: Bernardo Alkmim

-- Objetivo geral: implementação de provas formais para NP=PSPACE

-- Discussão: futuro do L∃∀N indo mais para linguagem de programação e
-- saindo um pouco da característica de provador,
-- comparação com outros provadores como Agda, Coq etc.

-- Discussão teórica: diferenças entre cálculo de construções e ITT interativa?

-- Teoria dos tipos simples × teoria dos tipos.
-- Simples é o primeiro nível da hierarquia: tipos básicos, funcionais, produtos, coprodutos finitos. Nat se bá. Mas quantidade finita de interação. Church - tentativa de fundamentar a matemática ocmo reação ao paradoxo de Russell.
-- A teoria dos tipos (não simples) envolve abstração sobre os tipos simples.
-- λ cube? Sabores de λ calculus?

-- λ calculus. Modelo de computação assim como funções recursivas, máquinas de Turing etc.
-- Operador de ponto fixo Y ≡ λf.((λx. f (x x))(λx. f (x x))) para realizar recursão primitiva e geral.
-- Independência do Y para o tipo de dado utilizado → não tem tipo (versão não tipada).
-- λ calculus tipado: paradoxo de Russell e teorema de Gödel. Não podemos fazer (x x) poiso primeiro deve ter um tipo funcional sobre o segundo, mas os tipos devem ser o mesmo (pois é o mesmo cara). Aí perde a graça pois Y não pode ser realizado. Temos apenas recursão primitiva, e só funções totais.
-- Obs.: λ calculus não é extensional.

-- Outro modelo computacional: lógica combinatória (Haskell Curry).
-- K : A → (B → A)
-- S : (A → (B → C)) → ((A → B) → (A → C))
-- Dupla Neg : ¬¬A → A
-- Efq : A → (¬A → B) 
-- Modus ponens : α, α → β ⊢ β
-- Substituição : α ⊢ σ[x/y] α
-- Schoenfinkel : aplicação associativa à esquerda
-- K a b ▷ a
-- S a b c ▷ a c (b c)
-- I ≡ SKK (ou SKS, ou SK batatinha). I a ▷ a
-- Não há substituição pois não há variáveis!!!! (Curry não gostava de substituição de variáveis no nível lógico)
-- Relação entre o que é demonstrado por K S + modus ponens e substituição (lógica intuicionista minimal) e o que pode ser feito com combinadores. Toda prova em IPL (minimal) corresponde a um combinador (e vice-versa).
-- À época não havia tipos, e o isomorfismo Curry-Howard é tipado (tipos são fórmulas). Howard: types as formulas.


-- Codificar λ calculus em combinadores
-- [x] v 							= I, se x = v, e K v, se x != v
-- [x] (e e') = ([x] e) ([x] e') 	= S ([x] e) ([x] e')
-- [x] (λy. e) 						= [x]([y] M)
-- e e' ▷* L ⇔ e* e'* ▷* L* (via Church-Rosser)

-- Paralelos de normalização de provas em Dedução Natural (para M→) e normalização de λ calculus tipado.

-- Normalização forte: todo termo converge i.e. toda computação para.
-- λ calculus tipado apresenta normalização forte.

-- Ter recursão (primitiva) para o λ calculus tipado, nos moldes do Y.
-- É necessário criar um combinador de recursão para cada tipo.
-- Objetivo: alguém que seja Y M ≡ M (Y M).

-- Recursão primitiva:
-- f(x,0) = g(x)
-- f(x,s(y)) = h(x, y, f(x,y))
-- Como colocar no λ calculus?
-- Tipo "formador de f"
-- g : A → A
-- h : A → Nat → A → A
-- f : A → Nat → A
-- Operador de recursão para A.
-- Rec^{A}: (A → A) → Nat → (A → Nat → A → A) → (A → Nat → A)
-- Rec^{A}(g, n, h) = g, se n = 0
--                  = h(g, k, Rec^{A}(g, h, k)), se n = s(k)

-- Resultado do Gödel no teorema da incompletude: toda prova na aritmética com indução corresponde a uma função computável definida por recursão primitiva.

-- Como faz para colocar Ackermann? Coloca a recursão em dois valores: novo construtor de recursão.
-- Tem hierarquia de funções totais, precisa de um construtor para funções (ainda totais) superiores a Ackermann.
-- Sistema T de tipos transfinitos.
-- Rec0, Rec1, Rec2 etc. para cada tipo. RecListas (de primeira ordem). RecParesDeListas. RecListasDeListas etc. cada uma pra um tipo e cada operador pra cada função de cada tipo. Isso engloba todas as funções computáveis totais (Gödel). ω elevado a ω etc. (aquelas brincadeiras do Hermann) aka ε0.