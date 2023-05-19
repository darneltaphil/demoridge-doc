---
sidebar_position: 3
---

# GovtPortal Installation

## Github Code

:::info Note
Start this section only after you have set up your development environment, installed wordpress with network setup activated.
:::

### Create Theme

1. Create a folder named `8.2` within your wordpress foder structure:
   `8.2` also represents the current stable version of hte application.

   ```
   [Drive:]\xampp\htdocs\govtportal\wp-content\themes\8.2
   ```

### Clone Code

2. Clone GovtPortal from Github [here](https://github.com/shengui919/govtportal-8.git) in the folder `8.2`
   :::danger Access Required
   You must first request access to the repo.
   :::

   ```
   https://github.com/shengui919/govtportal-8.git
   ```

### Extra

3. Replace the file <code> env.php</code> with the following [`env.php`](/files/env.php).
   Do not copy and paste the following content. Use the the content of the downloaded file (env.php)

   ```< ?php
   define('GP_API_PAYMENT_URL', 'http://192.168.x.x/gateway/payment.php');
   define('GP_API_SERVICE_URL', 'http://192.168.x.x/gateway/service.php');
   define('GP_API_DOCUMENT_URL', 'http://192.168.x.x/gateway/document.php');
   define('GP_DOCUMENTS_URL', 'http://192.168.x.x/documents');
   define('GP_ESIGN_URL', 'http://192.168.x.x/esign');
   define('GP_MINOR_VERSION', '8.10');
   define('GP_MAIL_HOST', '127.0.0.1');
   define('GP_MAIL_SMTPAUTH', false);
   define('GP_MAIL_USERNAME', 'transaction@govtportal.com');
   define('GP_MAIL_PASSWORD', '');
   define('GP_MAIL_SMTPSECURE', '');
   define('GP_MAIL_PORT', 2025);
   ```

4. Create a file named `style.css` within your wordpress foder structure:

   ```
   [Drive:]\xampp\htdocs\govtportal\wp-content\themes\8.2\style.css
   ```

### Wordpress Config

Refere to Lin here....
