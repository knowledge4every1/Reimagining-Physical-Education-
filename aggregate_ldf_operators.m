% aggregate_ldf_operators.m
function [ldfswwa, ldfswwg] = aggregate_ldf_operators(norm_data, weights, theta)
[n, m, ~] = size(norm_data);
ldfswwa = zeros(n, 4);
ldfswwg = zeros(n, 4);

for i = 1:n
    f_wsa = 1; g_wsa = 1; a_wsa = 1; b_wsa = 1;
    f_wpa = 1; g_wpa = 1; a_wpa = 1; b_wpa = 1;
    for j = 1:m
        f = norm_data(i,j,1); g = norm_data(i,j,2);
        a = norm_data(i,j,3); b = norm_data(i,j,4);
        w = weights(j);
        f_wsa = f_wsa * (1 - f * theta / (1 + theta))^w;
        g_wsa = g_wsa * ((theta * g + 1) / (1 + theta))^w;
        a_wsa = a_wsa * (1 - a * theta / (1 + theta))^w;
        b_wsa = b_wsa * ((theta * b + 1) / (1 + theta))^w;

        f_wpa = f_wpa * ((theta * f + 1) / (1 + theta))^w;
        g_wpa = g_wpa * (1 - g * theta / (1 + theta))^w;
        a_wpa = a_wpa * ((theta * a + 1) / (1 + theta))^w;
        b_wpa = b_wpa * (1 - b * theta / (1 + theta))^w;
    end
    ldfswwa(i,:) = [1 + theta/theta * (1 - f_wsa), ...
                    (g_wsa - 1)/theta, ...
                    1 + theta/theta * (1 - a_wsa), ...
                    (b_wsa - 1)/theta];
    ldfswwg(i,:) = [(f_wpa - 1)/theta, ...
                    1 + theta/theta * (1 - g_wpa), ...
                    (a_wpa - 1)/theta, ...
                    1 + theta/theta * (1 - b_wpa)];
end
end
