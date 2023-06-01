---
sidebar_position: 2
---

import IconItem from "@site/src/components/IconItem.js"
import { faPhp, faWordpress, faServicestack, faCloudflare, faExpeditedssl, faFontAwesome, faJs } from "@fortawesome/free-brands-svg-icons";

# Environement Setup

:::info Note
This documentation describes the installation on a local machine
:::

## Local Setup

### Servers

<ul>
<li>
<IconItem  size="2x" label="Apache HTTP Server" />
</li>
<li>
<IconItem icon={faPhp}  size="2x" label="PHP Programming Language" />
</li>
<li>
<IconItem  size="2x" label="MySQL Database" />
</li>
</ul>

:::tip My tip
To get **PHP**, **Apache** and **MySql** servers, you can install _**XAMPP**_ or _**WAMP**_, whichever you feel comfortable with .
We have several options:
:::

<ul>
<li>XAMPP (for WINDOWS)</li>
<li>EASYPHP</li>
<li>AMPPS</li>
<li>MAMP (for MAC)</li>
</ul>

When installing XAMPP server, you are recommended to leave the installation parameters as default.

- [XAMPP](https://www.apachefriends.org/download.html) version 8.2.4 or above:

#### Steps

1. Create a database : You can any name for your database.
   But we suggest `govtportal` as this database name will be used throughout the documentation.

   :::info About the database
   Keep username **root** and a password **""**.
   :::

2. Import the application database schema [Schema Here](/files/ippayware_main.sql)

### CMS

Install Wordpress ([tutorial](https://wordpress.org/documentation/)) and activate the [Network Setup](https://wordpress.org/documentation/article/create-a-network/).

- [Wordpress](https://wordpress.org/download/) version 6.2 or above

### IDE

You can use any IDE of your choice.

- [IDE - VSCode](https://code.visualstudio.com/download) version 1.78 or above:

## Remote Server Setup
