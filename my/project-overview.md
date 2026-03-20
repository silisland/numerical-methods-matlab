# 项目内容分析

## 项目简介

本项目（numerical-methods-matlab）由 Cristiano Fraga G. Nunes 开发，使用 MATLAB 实现了数值分析中的经典算法，涵盖方程求根、插值、多项式、数值微分、数值积分、常微分方程求解以及线性方程组的直接法与迭代法，共计 27 个函数文件。

---

## ASCII 文件树

```
numerical-methods-matlab/
├── .gitignore                                  # Git 忽略配置
├── LICENSE.md                                  # 许可证
├── README.md                                   # 项目说明文档
├── main.m                                      # 主入口脚本（包含14个调用示例）
│
├── solutions/                                  # 方程求根方法
│   ├── bisection.m                             # 二分法
│   ├── newton.m                                # 牛顿法（切线法）
│   └── secant.m                                # 割线法
│
├── interpolation/                              # 插值方法
│   ├── lagrange.m                              # 拉格朗日插值
│   └── neville.m                               # 内维尔逐次线性插值
│
├── polynomials/                                # 多项式算法
│   ├── briot_ruffini.m                         # 布里奥-鲁菲尼多项式综合除法
│   └── newton_divided_difference.m             # 牛顿差商插值多项式
│
├── differentiation/                            # 数值微分方法
│   ├── derivative_backward_difference.m        # 后向差分公式（O(h) 精度）
│   ├── derivative_three_point.m                # 三点中心差分公式（O(h²) 精度）
│   └── derivative_five_point.m                 # 五点中心差分公式（O(h⁴) 精度）
│
├── integration/                                # 数值积分方法
│   ├── composite_trapezoidal.m                 # 复合梯形公式（函数形式）
│   ├── composite2_trapezoidal.m                # 复合梯形公式（表格数据形式）
│   ├── composite_simpson.m                     # 复合辛普森 1/3 公式（函数形式）
│   └── composite2_simpson.m                    # 复合辛普森 1/3 公式（表格数据形式）
│
├── ode/                                        # 常微分方程初值问题求解
│   ├── euler.m                                 # 欧拉法（一阶）
│   ├── taylor2.m                               # 泰勒法（二阶）
│   ├── taylor4.m                               # 泰勒法（四阶）
│   ├── rk4.m                                   # 四阶龙格-库塔法（单个方程）
│   └── rk4_system.m                            # 四阶龙格-库塔法（方程组）
│
├── linear_systems/                             # 线性方程组直接解法
│   ├── gauss_elimination_pp.m                  # 列主元高斯消去法
│   ├── forward_substitution.m                  # 前向替换（下三角方程组）
│   └── backward_substitution.m                 # 后向替换（上三角方程组）
│
├── linear_systems_iterative/                   # 线性方程组迭代解法
│   ├── jacobi.m                                # 雅可比迭代法
│   └── gauss_seidel.m                          # 高斯-赛德尔迭代法
│
└── my/                                         # 项目文档（本目录）
    └── project-overview.md                     # 项目内容分析（本文件）
```

---

## 各模块详细说明

### 1. `solutions/` — 方程求根

求解方程 f(x) = 0 的数值方法：

| 文件 | 方法 | 说明 |
|------|------|------|
| `bisection.m` | 二分法 | 通过不断将区间二等分来逼近根，收敛稳定但速度较慢 |
| `newton.m` | 牛顿法 | 利用函数导数构造切线求根，收敛速度快（二阶），需提供导函数 |
| `secant.m` | 割线法 | 类牛顿法，用差商代替导数，无需显式导函数 |

---

### 2. `interpolation/` — 插值

已知若干节点处的函数值，估算任意点处的函数值：

| 文件 | 方法 | 说明 |
|------|------|------|
| `lagrange.m` | 拉格朗日插值 | 构造拉格朗日基多项式并求和，形式直观 |
| `neville.m` | 内维尔法 | 用嵌套乘法递推计算插值多项式，数值稳定性好 |

---

### 3. `polynomials/` — 多项式

多项式的运算与分析工具：

| 文件 | 方法 | 说明 |
|------|------|------|
| `briot_ruffini.m` | 布里奥-鲁菲尼法 | 用综合除法将多项式 P(x) 除以 (x - r)，常用于多项式因式分解 |
| `newton_divided_difference.m` | 牛顿差商法 | 利用差商表构造牛顿插值多项式 |

---

### 4. `differentiation/` — 数值微分

用有限差分公式近似计算函数导数：

| 文件 | 方法 | 精度 | 说明 |
|------|------|------|------|
| `derivative_backward_difference.m` | 后向差分 | O(h) | 适用于仅有左侧数据点的情况 |
| `derivative_three_point.m` | 三点公式 | O(h²) | 中心差分，精度更高 |
| `derivative_five_point.m` | 五点公式 | O(h⁴) | 更高阶精度，需要更多数据点 |

---

### 5. `integration/` — 数值积分

计算定积分 ∫f(x)dx 的数值方法，分为函数形式和表格数据形式两类：

| 文件 | 方法 | 说明 |
|------|------|------|
| `composite_trapezoidal.m` | 复合梯形法（函数） | 将积分区间分成 n 段，每段用梯形面积近似 |
| `composite2_trapezoidal.m` | 复合梯形法（表格） | 输入等距离散数据点，用梯形法求积 |
| `composite_simpson.m` | 复合辛普森法（函数） | 每两段用二次多项式拟合，精度高于梯形法 |
| `composite2_simpson.m` | 复合辛普森法（表格） | 输入等距离散数据点，用辛普森法求积 |

---

### 6. `ode/` — 常微分方程求解

求解初值问题 y' = f(t, y)，y(t₀) = y₀ 的数值方法：

| 文件 | 方法 | 阶数 | 说明 |
|------|------|------|------|
| `euler.m` | 欧拉法 | 一阶 | 最简单的单步法，误差为 O(h) |
| `taylor2.m` | 泰勒法 | 二阶 | 利用二阶泰勒展开，需提供 f 的一阶偏导 |
| `taylor4.m` | 泰勒法 | 四阶 | 利用四阶泰勒展开，精度更高 |
| `rk4.m` | 四阶龙格-库塔 | 四阶 | 最常用的高精度单步法，无需显式高阶导数 |
| `rk4_system.m` | 四阶龙格-库塔（方程组） | 四阶 | 适用于多个耦合常微分方程组成的系统 |

---

### 7. `linear_systems/` — 线性方程组直接解法

精确求解线性方程组 Ax = b：

| 文件 | 方法 | 说明 |
|------|------|------|
| `gauss_elimination_pp.m` | 列主元高斯消去法 | 将系数矩阵化为上三角形式，通过选取列主元提高数值稳定性 |
| `forward_substitution.m` | 前向替换 | 求解下三角线性方程组 Lx = b |
| `backward_substitution.m` | 后向替换 | 求解上三角线性方程组 Ux = b |

---

### 8. `linear_systems_iterative/` — 线性方程组迭代解法

通过迭代逼近求解线性方程组 Ax = b：

| 文件 | 方法 | 说明 |
|------|------|------|
| `jacobi.m` | 雅可比迭代法 | 每次迭代同步更新所有分量，适合并行计算 |
| `gauss_seidel.m` | 高斯-赛德尔迭代法 | 每次迭代立即使用最新分量，收敛速度通常快于雅可比法 |

---

## 文件统计

| 类型 | 数量 |
|------|------|
| MATLAB 函数文件（.m） | 27 |
| Markdown 文档（.md） | 3（README.md、LICENSE.md、my/project-overview.md） |
| 配置文件 | 1（.gitignore） |
| **合计** | **31** |
