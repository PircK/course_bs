data {
  int n;                           // number of observations
  int m;                           // number of independent variables
  row_vector[m] x[n];              // independent variables
  int k;                           // number of outcomes
  array[n] int<lower=1,upper=k> y; // dependent variables
}

parameters {
  vector[m] beta; // beta coefficients
  ordered[k-1] c; // cutpoints
}

model {
  // beta prior
  beta ~ cauchy(0, 2.5);

  for (i in 1:n)
    y[i] ~ ordered_logistic(x[i] * beta, c);
}
