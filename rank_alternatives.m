% rank_alternatives.m
load_ldf_data;
norm_data = normalize_ldf(ldf_data);
[ldfswwa, ldfswwg] = aggregate_ldf_operators(norm_data, weights, theta);
scores = compute_waspas_score(ldfswwa, ldfswwg, tau);

% Display ranked alternatives
[sorted_scores, ranking] = sort(scores, 'descend');
disp('Ranking of Alternatives:');
disp(ranking);
disp('Scores:');
disp(sorted_scores);
