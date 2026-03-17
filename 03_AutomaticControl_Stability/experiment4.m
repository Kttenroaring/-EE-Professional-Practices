% 二阶系统伯德图绘制
clear; clc;

% 定义参数组合
params = [
    25, 0.1, 1;   % K=25, T=0.1, Ti=1
    25, 0.2, 1;   % K=25, T=0.2, Ti=1
    20, 0.5, 0.5; % K=20, T=0.5, Ti=0.5
];

% 创建伯德图
figure;
hold on;

for i = 1:size(params, 1)
    K = params(i, 1);
    T = params(i, 2);
    Ti = params(i, 3);
    
    % 计算自然频率和阻尼比
    wn = sqrt(K / (Ti * T));
    xi = 0.5 * sqrt(Ti / (K * T));
    
    % 构造传递函数
    num = K;
    den = [Ti*T, Ti, K];
    sys = tf(num, den);
    
    % 绘制伯德图
    bode(sys);
    
    % 显示参数信息
    legendInfo{i} = sprintf('K=%.1f, T=%.1f, Ti=%.1f', K, T, Ti);
end

% 添加图例和标题
legend(legendInfo, 'Location', 'best');
title('二阶系统伯德图（不同参数组合）');
grid on;
hold off;