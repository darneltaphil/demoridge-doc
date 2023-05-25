---
sidebar_position: 1
toc_min_heading_level: 2
---

# High Level Architecture

GovtPortal was developed with Wordpress Multisite. That way, we can create more than one **website** on a single WordPress installation.
In our context, a **website** represent [a town or city] ...(clarify this with Lin)

:::info About the Architecture

We will provide here only the application's high level architecture

:::

## Main Site

![](../../static/img/wordpress_multisite.png)

### What is going on here?

GovtPortal is installed on a single WordPress installation, running a single database: **govtportal**. <br/>
This single wordpress multisite installation is used to create and deploy private sector clients, governement agencies and other partners websites.<br />
The children sites will share **themes, admins and plugins (if any)**.
Each child site represents a website deployed for a client.

## Child Site

A child site has a defined number of portals (based on the services they are going offer).

![](../../static/img/child_site.png)

### What is going on here?

#### A. **The database** [`govtportal`](./database)

The database contains all the necessary tables (structure and data). <br />

**`zoho_products`** table contains the definition of all the portals on the site. the **Zoho Products** are generated on the ZOHO platform, external to GovtPortal application.<br />

**`sa_fields`** table contains the definition of form fields and type that must be displayes on a particular **sa_form**.<br />

**`trans_all`** table contains saved transactions. <br />

#### B. **The Portals** [(Find More)](../portals/intro)

The `zoho_products` table provides important details for the portals. for instance: _Product Owner, Portal Name, the Gateway, Merchant Details_, etc.
:::note Zoho Product details
We count 104 zoho product details in all
:::

#### C. **The Forms**

Two (2) types of form are used. **_Ticket search form_** and **_SA Form_**. <br />
Using a ticket search form means that the portal is Integrated. The platform user must then search for his/her ticket using the ticket number. <br />
Using the SA Form means the portal is not Itegrated. The platform user fills in additional detials neeted to process the payment.<br />

It is important to clarify what `INTEGRATION` means here : If GovtPortal has a dataset of ticket numbers for a specific portal, that portal is integrated.

The portal details from `zoho_products` indicated the name of the form to use.

#### D. **Processing Payment**

This is where the payment processing happens. There is a query/response communication between GovtPortal and 3d party / Gateways. The gateway details are also provided by the portal details from `zoho_products`.

#### E. **Payment Getways**

Payment Gateway REST APis

#### F. **Notifications and Receipt**

GovtPortal notifies the user of the platform via email or SMS.
