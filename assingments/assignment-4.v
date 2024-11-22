(*дедлайн - 14 декабря*)

Module Assignment4.

(*
1. Реализуйте следующие логические операции:
*)

(*
    2 балла,
    логическое или
*)
Definition or (a b : bool) : bool := 

(*
    2 балла,
    исключаещее или
*)
Definition xor (a b : bool) : bool := 

(*
    2 балла,
    равенство bool аргументов (без использования eq)
*)
Definition eq (a b : bool) : bool :=

(*
2. Реализуйте следующие операции над натуральными числами:
*)

Inductive nat : Type :=
| O
| S of nat.
    
(*
    2 балла,
    уменьшение числа на 2,
    sub2 3 = 1
    sub2 1 = 0
    sub2 0 = 0
*)
Definition sub2 (n : nat) : nat :=

(*
    3 балла,
    вычитание чисел,
    sub 5 3 = 2
    sub 3 5 = 0
*)
Definition sub (m n : nat) : nat :=

(*
    2 балла,
    деление числа на 2,
    div2 5 = 2
    div2 1 = 0
*)
Definition div2 (m n : nat) : nat :=

(*
    5 балла,
    деление чисел,
    div 5 3 = 1
    div 3 5 = 0
*)
Definition div (m n : nat) : nat :=

(*
    2 балла,
    сравнение чисел на равенство
*)
Definition eq (m n : nat) : bool :=

(*
    2 балла,
    сравнение чисел на меньше или равно
*)
Definition leq (m n : nat) : bool :=

(*
3. Реализуйте следующие законы и аксиомы пропозициональной логики
*)

Variables A B C : Prop.

(* 2 балла *)
Definition anb1 :
  A /\ B -> A
:=

(* 2 балла *)
Definition impl_trans :
  (A -> B) -> (B -> C) -> A -> C
:=

(* 3 балла *)
Definition HilbertS :
  (A -> B -> C) -> (A -> B) -> A -> C
:=

(* 3 балла *)
Definition DNE_triple_neg :
  ~ ~ ~ A -> ~ A
:=

(* 2 балла *)
Definition or_comm :
  A \/ B -> B \/ A
:=

(*
4. (3 балла) Докажите, что из лжи следует всё, что угодно:
*)
Theorem absurd (F: False): 1 = 2.
Proof.
    
Qed.

(*
5. (3 балла) Докажите, что сумма коммутативна:
*)
Theorem sum_comm: forall m n, plus m n = plus n m.
Proof.
    
Qed.

(*
6. (3 балла) Напишете функцию для подсчёта высоты дерева со следующей сигнатурой tree -> nat:
*)
Inductive tree: Set :=
| list: tree
| node: tree -> tree -> tree.

(*
7. (5 баллов)* Докажите следующее утверждение
*)

Theorem andb_eq_orb :
  forall (b c : bool),
  (andb b c = orb b c) -> b = c.
Proof.

Qed.

(*
8. (12 баллов)* Докажите следующее утверждение
*)

Definition left := 
    forall p, p \/ ~p.
Definition right := 
    forall (A: Set) (p: A -> Prop)(q: Prop),
        (forall x: A, q \/ p x) <-> (q \/ forall x: A, p x).

Theorem left_iff_right: left <-> right.
Proof.

Qed.


(*
9. (15 баллов)* (задание не на Coq) Выберете незакрытый (либо закрытый за последний год) unsound баг из компилятора Rust с лейблами T-types и C-bug (можно использовать вот этот фильтр https://github.com/rust-lang/rust/issues?q=is%3Aissue%20state%3Aopen%20label%3AC-bug%20label%3AT-types), разберитесь, в чём он заключается, и напишите его детальное описание. Баллы за это задание будут выставляться субъективно за сложность выбранного бага и детального его описания.

Дополнительные баллы (помимо 15) можно получить, если предоставить описание и/или PoC того, как этот баг можно использовать для выхода из Rust sannbox, ситуации, когда Вы можете исполнять произвольный раст код и Вам необходимо выполнить произвольный код.
*)