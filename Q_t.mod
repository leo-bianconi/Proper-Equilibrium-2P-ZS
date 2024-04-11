# all variables already defined in P_t.mod are commented out
#set phi_1;
#set phi_2;
#set phi_2_t;
#set C2_t;
#param A{phi_1, phi_2};
#param value := 0;
param value_upd default 0;
var x_Q{phi_1} >= 0;                                                # this corresponds to x
var p{phi_2_t} >= 0, <= 1;


maximize sum_probabilities: sum{i in phi_2_t} p[i];
#subject to no_regret_on_unexploitable {i in C2_t}:
#    sum{j in phi_1} (A[j,i] - value) * x[j] >= 0
#;
subject to min_max_on_exploitable_upd {i in phi_2_t}:
    sum{j in phi_1} (A[j,i] - value_upd) * x_Q[j] >= p[i]
;

# player 2
#param value_b := 0;
param value_upd_b default 0;
var x_Q_b{phi_2} >= 0;
var p_b{phi_1_t} >= 0, <= 1;

maximize sum_probabilities_b: sum{i in phi_1_t} p_b[i];
#subject to no_regret_on_unexploitable {i in C2_t}:
#    sum{j in phi_1} (A[j,i] - value) * x[j] >= 0
#;
subject to min_max_on_exploitable_upd_b {i in phi_1_t}:
    sum{j in phi_2} (-1* A[i, j] - value_upd_b) * x_Q_b[j] >= p_b[i]
;