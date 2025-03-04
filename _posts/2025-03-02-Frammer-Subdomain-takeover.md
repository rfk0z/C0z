## Framer Subdomain takeover

**Introduction:** Subdomain takeover is a type of vulnerability where attackers can claim a subdomain that is no longer in use due to misconfigured DNS records. This can happen when a website’s DNS points to a service that is no longer active, allowing malicious actors to take control of that subdomain.

In this post, we’ll focus on how subdomains like

*   `*.framer.website`
*   `*.framer.ai`
*   `*.framer.photos`
*   `*.framer.media`
*   `*.framer.wiki`

or any custom domains example.com with a "Page Not Found | Framer" error (Pict, 1.0), are vulnerable to takeover. By following a few simple steps, you can take over a vulnerable subdomain and gain control over its content.

![Pict, 1.0](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*JmtBCTBt8lV38A9rWWHGTg.png)

**What Does a Vulnerable Subdomain Look Like?**

Subdomains hosted on Framer, such as:

*   `*.framer.website`
*   `*.framer.ai`
*   `*.framer.photos`
*   `*.framer.media`
*   `*.framer.wiki`

Or custom domains showing the message body “**Sign up for Framer to publish your own website**.” or the title “**Page Not Found | Framer**” are prime targets for takeover. These domains are typically associated with inactive or forgotten projects on the Framer platform.

**Steps to Perform a Subdomain Takeover:**

1.  **Sign Up for Framer:** Visit [login.framer.com](https://login.framer.com) and create an account.
2.  **Create a Page:** After completing your signup, you will be directed to the Framer project dashboard, Click on the “Page” feature in the dashboard. You can select any page, whether it’s an existing one or a new one.
3.  **Publish the Page:** In the top-right corner, click on “Publish.” This will allow you to set up the publishing options for your page.
4.  **Add a Custom Domain:** After clicking “Publish,” you’ll see an option to “Add Domain.” Here, you can enter the vulnerable domain that you identified (either a free subdomain under `framer.website` or a custom domain).

*   For domains under `framer.website`, the subdomain is free to use.
*   For custom domains, there may be a cost associated with using the domain.

![captionless image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*KAqEx-fQtIJIW5hIlt2f1w.png)

#Subdomain

#Subdomain_Takeover
