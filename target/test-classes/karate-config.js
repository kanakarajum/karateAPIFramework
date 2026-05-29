function fn() {
  var env = karate.env; // Get system property 'karate.env' (e.g., mvn test -Dkarate.env=qa)
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev'; // Default to 'dev' if no environment is specified
  }

  // Base configuration object with global variables
  var config = {
    env: env,
    baseUrl: 'https://gorest.co.in',
    myToken: '5188ca0fca93a740de2a85f61a5bba9db4c7ab35e2109d5436d364d6222aacf9'
  };

  
  // Environment-specific overrides
  if (env == 'dev') {
    config.baseUrl = 'https://gorest.co.in';
  } else if (env == 'qa') {
    config.baseUrl = 'https://qa-api.example.com';
  } else if (env == 'prod') {
    config.baseUrl = 'https://api.example.com';
  }

  // Global timeout settings (optional)
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config; // This object becomes available globally in features
}
