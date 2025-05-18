<?php

namespace modules\hrpreview;

use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

/**
 * Hr Preview asset bundle
 */
class HrPreviewAsset extends AssetBundle
{
    // Where our JS "lives"
    public $sourcePath = '@modules/hrpreview';

    // Ensure CP’s core scripts (including garnish.js) are available
    public $depends = [
        CpAsset::class,
    ];

    // Our custom script
    public $js = [
        'script.js',
    ];
}
