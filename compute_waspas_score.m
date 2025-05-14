% compute_waspas_score.m
function final_score = compute_waspas_score(ldfswwa, ldfswwg, tau)
n = size(ldfswwa, 1);
final_score = zeros(n, 1);
for i = 1:n
    score_wsa = 0.5 * ((ldfswwa(i,1) - ldfswwa(i,2)) + (ldfswwa(i,3) - ldfswwa(i,4)));
    score_wpa = 0.5 * ((ldfswwg(i,1) - ldfswwg(i,2)) + (ldfswwg(i,3) - ldfswwg(i,4)));
    final_score(i) = tau * score_wsa + (1 - tau) * score_wpa;
end
end
