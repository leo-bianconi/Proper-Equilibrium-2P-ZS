set phi_1;
set phi_2;
set phi_2_t;

set C2_t;
param A{phi_1, phi_2};
param value := 0;

var x{phi_1} >= 0;
var z;

maximize value_of_game: z;
subject to no_regret_on_unexploitable {i in C2_t}:
    sum{j in phi_1} (A[j,i] - value) * x[j] >= 0
;
subject to min_max_on_exploitable {i in phi_2_t}:
    sum{j in phi_1} A[j,i] * x[j] >= z
;
subject to sum_to_one: sum{j in phi_1} x[j] = 1;
