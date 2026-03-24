for k = 1:n-1
    % 1. 选主元：找到第 k 列中，从第 k 行开始绝对值最大的元素索引
    [~, max_idx] = max(abs(U_aug(k:n, k)));
    max_idx = max_idx + k - 1; % 转换为全局索引

    % 2. 检查奇异性
    if abs(U_aug(max_idx, k)) < 1e-12
        warning('矩阵接近奇异，可能无唯一解。');
        continue; 
    end

    % 3. 交换行 (如果需要)
    if max_idx ~= k
        U_aug([k, max_idx], :) = U_aug([max_idx, k], :);
    end

    % 4. 消元 (向量化操作)
    for i = k+1:n
        factor = U_aug(i, k) / U_aug(k, k);
        U_aug(i, k:end) = U_aug(i, k:end) - factor * U_aug(k, k:end);
    end
end

% 检查最后一个主元
if abs(U_aug(n, n)) < 1e-12
    warning('最后一个主元为零，无唯一解。');
end