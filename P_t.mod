set phi_1;                                              # actions of P1
set phi_2;                                              # actions of P2
set phi_2_t;                                            # exploitable actions of P2

set C2_t;                                               # unexploitable actions of P2
param A{phi_1, phi_2};                                  # payoff matrix
param value := 0;                                       # value of game

var x_P{phi_1} >= 0;                                    # this corresponds to x
var z;                                                  # minmax value

maximize value_of_game: z;
subject to no_regret_on_unexploitable {i in C2_t}:
    sum{j in phi_1} (A[j,i] - value) * x_P[j] >= 0
;
subject to min_max_on_exploitable {i in phi_2_t}:
    sum{j in phi_1} A[j,i] * x_P[j] >= z
;
subject to sum_to_one: sum{j in phi_1} x_P[j] = 1;
