<?php

namespace modules\hrpreview;

use Craft;
use yii\base\Module as BaseModule;

/**
 * HrPreview module
 *
 * @method static HrPreview getInstance()
 */
class HrPreview extends BaseModule
{
    public function init(): void
    {
        Craft::setAlias('@modules/hrpreview', __DIR__);

        parent::init();

        Craft::$app->onInit(function() {
            if (Craft::$app->getRequest()->getIsCpRequest()) {
                Craft::$app->getView()->registerAssetBundle(HrPreviewAsset::class);
            }
        });
    }
}
