---
sidebar_position: 4
---

# Configuration

### Extra

1. Replace the file <code> env.php</code> with the following [`env.php`](/files/env.php).
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

2. Create a file named `style.css` within your wordpress foder structure:

   ```
   [Drive:]\xampp\htdocs\govtportal\wp-content\themes\8.2\style.css
   ```

### Wordpress Config

Refere to Lin here....
