<?php
use craft\helpers\App;

return [
  'as corsFilter' => [
    'class' => \craft\filters\Cors::class,

    // Add your origins here
    'cors' => [
        'Origin' => [
          App::env('WEBSITE_URL'),
        ],
        'Access-Control-Request-Method' => ['GET'],
        'Access-Control-Request-Headers' => ['*'],
        'Access-Control-Allow-Credentials' => true,
        'Access-Control-Max-Age' => 86400,
        'Access-Control-Expose-Headers' => [],
    ],
  ],
];
