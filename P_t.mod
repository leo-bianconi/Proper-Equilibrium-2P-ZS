set phi_1;                                              # actions of P1
set phi_2;                                              # actions of P2
set phi_2_t;                                            # exploitable actions of P2

set C2_t;                                               # unexploitable actions of P2
param A{phi_1, phi_2};                                  # payoff matrix
param value default 0;                                  # value of game

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


# inverse problem for P2
set C1_t;
set phi_1_t;
var x_P_b{phi_2} >= 0;
var z_b;
param value_b default 0;

maximize value_of_game_b: z_b;
subject to no_regret_on_unexploitable_b {i in C1_t}:
    sum{j in phi_2} (-1 * A[i, j] - value_b) * x_P_b[j] >= 0
;
subject to min_max_on_exploitable_b {i in phi_1_t}:
    sum{j in phi_2} (-1 * A[i, j]) * x_P_b[j] >= z_b
;
subject to sum_to_one_b: sum{j in phi_2} x_P_b[j] = 1;