-------------------- MODULE Water --------------------

EXTENDS Naturals
CONSTANT B1_SIZE, B2_SIZE, T_SIZE, TARGET
VARIABLE b1, b2, t

WaterInit ==
    /\ b1 = 0
    /\ b2 = 0
    /\ t = T_SIZE

FillB1 ==
    /\ b1' = IF t > (B1_SIZE - b1) THEN B1_SIZE ELSE b1 + t
    /\ UNCHANGED b2
    /\ t' = IF t + b1 > B1_SIZE THEN t + b1 - B1_SIZE ELSE 0

FillB2 ==
    /\ UNCHANGED b1
    /\ b2' = IF t > (B2_SIZE - b2) THEN B2_SIZE ELSE b2 + t
    /\ t' = IF t + b2 > B2_SIZE THEN t + b2 - B2_SIZE ELSE 0

EmptyB1 ==
    /\ b1' = 0
    /\ UNCHANGED b2
    /\ t' = t + b1

EmptyB2 ==
    /\ UNCHANGED b1
    /\ b2' = 0
    /\ t' = t + b2

FromB2ToB1 ==
    /\ b1' = IF b2 > (B1_SIZE - b1) THEN B1_SIZE ELSE b1 + b2
    /\ b2' = IF b1 + b2 > B1_SIZE THEN b1 + b2 - B1_SIZE ELSE 0
    /\ UNCHANGED t

FromB1ToB2 ==
    /\ b1' = IF b1 + b2 > B2_SIZE THEN b1 + b2 - B2_SIZE ELSE 0
    /\ b2' = IF b1 > (B2_SIZE - b2) THEN B2_SIZE ELSE b1 + b2
    /\ UNCHANGED t

WaterNext ==
    \/ FillB1
    \/ FillB2
    \/ EmptyB1
    \/ EmptyB2
    \/ FromB1ToB2
    \/ FromB2ToB1

HC == WaterInit /\ [][WaterNext]_<<b1, b2>>

WaterInv ==
    /\ 
        \/ b2 /= TARGET
        \/ b1 /= TARGET

======================
