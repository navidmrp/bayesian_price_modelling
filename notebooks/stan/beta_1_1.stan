
data {
  int<lower=0> N;
  real<lower=0> dt;
  array[N] real x;
}
parameters {
  real mu;
  real lambda_plus;
  real lambda_minus;
  real<lower=1e-9> sigma;
  real<lower=0,upper=1> alpha;
}
model {
  // Priors
  mu        ~ normal(0, 1);
  lambda_plus  ~ normal(0, 10);
  lambda_minus ~ normal(0, 10);
  sigma        ~ normal(0, 1);
  alpha    ~ beta(1,1);

  // Recursive EMA (internal only)
  vector[N] ema;
  ema[1] = x[1];
  ema[2] = x[2];
  for (i in 3:N)
    ema[i] = alpha * x[i-1] + (1 - alpha) * ema[i-2];

  // Likelihood
  for (n in 3:N) {
    real diff      = (ema[n-1] - x[n-1]) / x[n-1];
    real up_move   = fmax(diff, 0);
    real down_move = fmin(diff, 0);
    real theta        = x[n-1] + dt * (mu + lambda_plus * up_move + lambda_minus * down_move) * x[n-1];
    real sd        = fmax(1e-9, abs(x[n-1]) * sigma * sqrt(dt));
    x[n] ~ normal(theta, sd);
  }
}
