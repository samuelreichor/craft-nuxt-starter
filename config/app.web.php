<?php

return [
  'as corsFilter' => [
    'class' => \craft\filters\Cors::class,

    // Add your origins here
    'cors' => [
        'Origin' => [
          'http://localhost:3000',
        ],
        'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
        'Access-Control-Request-Headers' => ['*'],
        'Access-Control-Allow-Credentials' => true,
        'Access-Control-Max-Age' => 86400,
        'Access-Control-Expose-Headers' => [],
    ],
  ],
];
