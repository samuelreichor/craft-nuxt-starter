# Starter Template for Nuxt x Craft CMS

Trust me it's easy!

## Requirements

- DDEV installed locally

## Get started

### 1. Start ddev
```bash
ddev start
```

### 2. Install Composer Packages and set up Craft
```bash
ddev composer install && ddev craft setup/keys
```

### 2. Import dummy database
```bash
ddev import-db --file=./databases/starter-db.sql
```

### 3. Launch Craft Control Panel
```bash
ddev launch
```

**You can access it with these credentials:**
<br>

>User: Admin <br>
>PW: admin123


### 4. Start frontend dev server
```bash
cd ./frontend && npm install && cp .env.example .env &&  npm run dev
```

### 5. Set env vars

To fetch from nuxt to a self-signed ddev server you have to use `NODE_TLS_REJECT_UNAUTHORIZED=0`. To use it just activate the `.env.example` by deleting the `.example` in the file name.

## Troubleshooting

### **Error: `<no response>` Fetch Failed**

If you encounter the error `<no response>` while trying to fetch data, follow these steps to identify and resolve the issue:

1. **Check the `baseUrl` Configuration**
    - Open the developer console in your frontend application.
    - Verify that the `baseUrl` property matches the value of your `PRIMARY_SITE_URL` environment variable in Craft CMS.
    - If the `baseUrl` does not match, the API endpoint being called is incorrect. Update the [configuration](https://samuelreichor.at/libraries/nuxt-craftcms/get-started/install#configuration) to ensure both values align.

2. **Validate the API Endpoint**
    - Copy and paste the generated API URL from your application (e.g.,
      ```
      https://craft-nuxt-starter.ddev.site/v1/api/queryApi/customQuery?elementType=entries&uri=__home__&one=1
      ```
      ) into your browser.
    - Check if the endpoint returns the expected response.
    - If the response is correct in the browser, but your application still fails, proceed to the next step.

3. **Set `NODE_TLS_REJECT_UNAUTHORIZED`**
    - Ensure the `NODE_TLS_REJECT_UNAUTHORIZED` environment variable is properly configured.
    - Add the following to your environment configuration:
      ```
      NODE_TLS_REJECT_UNAUTHORIZED=0
      ```
    - This is often required in local development environments where self-signed certificates or insecure HTTPS connections are used.


## More Information

You can find more information on [samuelreichor.at](https://samuelreichor.at/libraries)
