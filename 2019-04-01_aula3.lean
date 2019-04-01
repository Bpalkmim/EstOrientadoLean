constants A B C : Type
constant f : A
constant h : A → B
constant g : A → (B → C)

#check g f (h f)

#check (λg : A → (B → C), (λh : A → B, (λf : A, g f (h f))))