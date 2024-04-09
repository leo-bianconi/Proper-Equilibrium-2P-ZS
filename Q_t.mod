# all variables already defined in P_t.mod are commented out
#set phi_1;
#set phi_2;
#set phi_2_t;
#set C2_t;
#param A{phi_1, phi_2};
#param value := 0;
param value_upd default 0;
#var x{phi_1} >= 0;
var p{phi_2_t} >= 0, <= 1;

maximize sum_probabilities: sum{i in phi_2_t} p[i];
#subject to no_regret_on_unexploitable {i in C2_t}:
#    sum{j in phi_1} (A[j,i] - value) * x[j] >= 0
#;
subject to min_max_on_exploitable_upd {i in phi_2_t}:
    sum{j in phi_1} (A[j,i] - value_upd) * x[j] >= p[i]
;
