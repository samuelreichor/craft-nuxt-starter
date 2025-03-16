<?php

namespace modules\queryapiextensions\transformers; // Change this to your namespace

use samuelreichoer\queryapi\helpers\Utils;
use samuelreichoer\queryapi\transformers\BaseTransformer;
use verbb\navigation\elements\Node;

class NavigationTransformer extends BaseTransformer
{
    protected Node $navigation;

    public function __construct(Node $navigation)
    {
        parent::__construct($navigation);
        $this->navigation = $navigation;
    }

    /**
     * Transforms the Navigation Node into an array.
     *
     * @param array $predefinedFields
     * @return array
     */
    public function getTransformedData(array $predefinedFields = []): array
    {
        return [
            'metadata' => $this->getMetaData(),
            'title' => $this->navigation->title,
            'url' => $this->navigation->getUrl(),
            'uri' => $this->navigation->getNodeUri(),
            'fullUri' => Utils::getFullUriFromUrl($this->navigation->getUrl()),
            'type' => $this->navigation->getTypeLabel(),
            'level' => $this->navigation->level,
        ];
    }

    /**
     * Retrieves metadata from the Navigation Node.
     *
     * @return array
     */
    protected function getMetaData(): array
    {
        return array_merge(parent::getMetaData(), [
            'id' => $this->navigation->id,
            'siteId' => $this->navigation->site->id,
        ]);
    }
}
