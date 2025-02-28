<?php

namespace modules\queryapiextensions;

use Craft;
use craft\base\Event;
use modules\queryapiextensions\transformers\NavigationTransformer;
use samuelreichoer\queryapi\events\RegisterElementTypesEvent;
use samuelreichoer\queryapi\models\RegisterElementType;
use samuelreichoer\queryapi\services\ElementQueryService;
use yii\base\Module as BaseModule;

/**
 * QueryApiExtensions module
 *
 * @method static QueryApiExtensions getInstance()
 */
class QueryApiExtensions extends BaseModule
{
    public function init(): void
    {
        Craft::setAlias('@modules/queryapiextensions', __DIR__);

        parent::init();

        $this->attachEventHandlers();
    }

    private function attachEventHandlers(): void
    {
        Event::on(
            ElementQueryService::class,
            ElementQueryService::EVENT_REGISTER_ELEMENT_TYPES,
            function (RegisterElementTypesEvent $event) {
                $event->elementTypes[] = new RegisterElementType([
                    'elementTypeClass' => 'verbb\navigation\elements\Node',
                    'elementTypeHandle' => 'navigation',
                    'allowedMethods' => ['limit', 'handle', 'id', 'siteId'],
                    'transformer' => NavigationTransformer::class,
                ]);
            }
        );
    }
}
