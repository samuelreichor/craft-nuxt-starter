<?php
/**
 * Imager X plugin for Craft CMS
 *
 * Ninja powered image transforms.
 *
 * @link      https://www.spacecat.ninja
 * @copyright Copyright (c) 2020 André Elvan
 */

return [
    '*' => [
        'allowUpscale' => false,

        'cacheDuration' => 31536000, // 1 year
        'cacheDurationRemoteFiles' => 31536000, // 1 year
        'cacheDurationExternalStorage' => 31536000, // 1 year

        'fallbackImage' => getenv('FALLBACK_IMAGE') ?: null,
        'mockImage' => getenv('MOCK_IMAGE') ?: null,

        'imagerSystemPath' => '@webroot/assets/imager/',
        'imagerUrl' => '@web/assets/imager/',

        'optimizers' => [
            'jpegoptim',
            'jpegtran',
            'mozjpeg',
            'optipng',
            'gifsicle',
        ],

        'pngCompressionLevel' => 0,
    ],

    'production' => [
    ],

    'staging' => [
        'optimizers' => null,
    ],

    'dev' => [
        'optimizers' => null,
    ],
];
