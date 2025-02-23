# Starter Template for Nuxt x Craft CMS

Trust me it's easy!

## Requirements

- DDEV installed locally
- Basic Nuxt and Craft Knowledge

## Setup

```bash
./scripts/setup.sh
```

**Note:** If your frontend shows a nginx error on the first start you should refresh your Browser. 
This happens because the setup script launches the browser before the dev process is running. 

### Access the control panel:
Use these credentials to access the control panel:
- User: admin
- Password: admin123

## Scripts
- `ddev fe <command>`: cd's in the frontend folder and runs the provided command.
- `ddev npm run <command>` runs the commands in the frontend folder due to npm workspaces.

## Further Resources

- [Craft Query API](https://github.com/samuelreichor/craft-query-api): The Craft CMS Plugin, that powers this great stuff.
- [Nuxt Craft CMS](https://samuelreichor.at/libraries/nuxt-craftcms): The package used to get the query builder in Nuxt.
- [JS Craft CMS API](https://samuelreichor.at/libraries/js-craftcms-api): `nuxt-craftcms` is built on the `js-craftcms-api`.


## Support

If you encounter bugs or have feature requests, [please submit an issue](/../../issues/new). Your feedback helps improve the starter!

