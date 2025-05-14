% normalize_ldf.m
function norm_data = normalize_ldf(ldf_data)
[n, m, ~] = size(ldf_data);
norm_data = zeros(n, m, 4);
for i = 1:n
    for j = 1:m
        for k = 1:4
            norm_data(i,j,k) = ldf_data(i,j,k) / (1 + ldf_data(i,j,k));
        end
    end
end
end
