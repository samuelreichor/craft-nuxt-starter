# Starter Template for Nuxt x Craft CMS

Trust me it's easy!

## Requirements

- DDEV installed locally

## Get started

### 1. Start ddev
```bash
ddev start
```

### 2. Import dummy database
```bash
ddev import-db -p ./databases/starter-db.sql
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
cd ./fronend && npm install && npm run dev
```

### 5. Set env vars

To fetch from nuxt to a self-signed ddev server you have to use `NODE_TLS_REJECT_UNAUTHORIZED=0`. To use it just activate the `.env.example` by deleting the `.example` in the file name.

## More Information

You can find more information on [samuelreichor.at](https://samuelreichor.at/libraries)
