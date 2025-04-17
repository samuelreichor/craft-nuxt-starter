# Starter Template for Nuxt x Craft CMS

This starter is built using the [Craft Query API](https://samuelreichor.at/libraries/craft-query-api).  
You don’t need any knowledge of GraphQL—just familiarity with Craft CMS’s query builder is enough to get started.

## Features

✅ No GraphQl <br>
✅ Optimized images with ImagerX <br>
✅ World-class SEO with SeoMatic <br>
✅ Navigation Plugin installed and configured <br>
✅ Multilingual with Craft multisites <br>
✅ Fully runs on ddev <br>
✅ Tailwind v4, Nuxt v3, Eslint, Typescript, Craft v5
✅ Great Cats all over the place

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

**Note:** This template utilizes npm workspaces, which is why there are two package.json files. 
This setup allows you to run npm commands at the root level while managing multiple packages 
within the workspace efficiently. (`ddev npm run dev` does the same as `ddev fe npm run dev`)

## Important Security Notes

If you use this as a starter for your own application be sure to flip the access token! The access token used in that 
demo project is public available and not save at all.

## Further Resources

- [Craft Query API](https://samuelreichor.at/libraries/craft-query-api): The Craft CMS Plugin, that powers this great stuff.
- [Nuxt Craft CMS](https://samuelreichor.at/libraries/nuxt-craftcms): The package used to get the query builder in Nuxt.
- [JS Craft CMS API](https://samuelreichor.at/libraries/js-craftcms-api): `nuxt-craftcms` is built on the `js-craftcms-api`.


## Support

If you encounter bugs or have feature requests, [please submit an issue](/../../issues/new). Your feedback helps improve the starter!

