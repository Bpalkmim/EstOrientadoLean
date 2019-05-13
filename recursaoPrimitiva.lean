inductive Nat
| z : Nat
| suc : Nat → Nat

def natrec {C : Type} : C → (Nat → C → C) → Nat → C
| g h Nat.z 		:= g
| g h (Nat.suc n) 	:= h n (natrec g h n)

def add : Nat → Nat → Nat
:= λ n m, natrec m (λ x y, Nat.suc y) n

def mul : Nat → Nat → Nat
:= λ n m, natrec Nat.z (λ x y, add y m) n

#reduce add (Nat.suc Nat.z) (Nat.suc (Nat.suc Nat.z))

#reduce mul (Nat.suc (Nat.suc (Nat.suc Nat.z))) (Nat.suc Nat.z)

#reduce mul (Nat.suc (Nat.suc (Nat.suc Nat.z))) Nat.z