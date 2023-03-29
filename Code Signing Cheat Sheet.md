# Code Signing Cheat Sheet

## Diagram

An evolving overview of the whole fuckery:

![](code-signing/Code_Signing_Fuckery.jpg)

## Brainstorm: Entities / Properties for Diagram Update

* Developer Account
* Target
* Build Configuration
* Scheme
* Team ID
* App ID
* Device UDID
* Provisioning Profile
* Keychain (Login vs. System vs. iCloud)
    * Where are certificates best installed?
* Certificate
    * What (certificates, profiles ...) has to be renewed at all and when?
    * What can safely be removed / revoked in ASC when cleaning up a chaotic ASC account filled with legacy stuff?
* Public and Private certificate key
    * (how should a team store / provide the private key to its developers ... is that even still necessary?)
* Signing Identity
* Development Machine
* Specific App Capabilities
    * (the like which had/have to be associated with the provisioning profile ... which capabilities are that?)
* **Universal** App ID / Certificate / Provisioning Profile

## Pitfalls

* Register devices by **UDID**, even though the form in App Store Connect is confusing!

    ![](code-signing/use-udid.png)

	macOS system report shows the difference:
	![](code-signing/uuid-vs-udid.png)