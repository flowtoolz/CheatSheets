# Code Signing Cheat Sheet

## Basic Motivation

Code Signing protects against any tampering with an app, be it on the developer machine after compilation, during distribution (at Apple), or on the user's device after installation.

## Overview

An evolving overview of the whole fuckery:

![](code-signing/Code_Signing_Fuckery.jpg)

The diagram illustrates a typical context in which a team develops one app in context of some company.

* Developer Account
    * identified by a Team ID

* Provisioning Profile
    * contains/specifies entitlements, allowed devices (by their UDID), app ID (= Bundle ID), Team ID (of the developer account) and one certificate (signing identity)
    * typically, all developers sign with the same profile and thereby with the same Team ID
    * when someone joins the team, their development machine must typically be added to the profile. others are not required to re-install the updated profile immediately, if they don't use the newly registered machine.
    * the same signing identity (certificate) may be referenced by multiple profiles. for example, device tests might use a dedicated profile that contains the corresponing test devices

* Certificate (Signing Identity)
    * Ideally, all developers use the same signing identity (certificate) but each their own individual private key
    * The private key is being generated and stored locally (in Keychain Access), when a dev installs the certificate on his/her machine
    * Typically, the dev installs the certificate in the "Login" keychain, but "iCloud" could make sense when the developer uses multiple development machines
    * The certificate would need to be shared securely within the team. Storing it with the codebase in a private git repo is generally not considered to be secure enough.


## Pitfalls

* Register devices by **UDID**, even though the form in App Store Connect is confusing!

    ![](code-signing/use-udid.png)

	macOS system report shows the difference:
	![](code-signing/uuid-vs-udid.png)