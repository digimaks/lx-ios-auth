# AuthWrapperPackage

Local authentication for iOS — app passcode (PIN) lifecycle and biometric unlock.

It is one of the Swift packages used by **Digimaks**, a mobile digital wallet
continuing the work of the
[NOBID Consortium](https://www.nobidconsortium.com/) (the Nordic-Baltic eID
Project), one of the EU Large Scale Pilots preparing for eIDAS 2.0.

## Background

This package is the continuation of
[nobid-lsp-latvia/lx-ios-auth](https://github.com/nobid-lsp-latvia/lx-ios-auth),
developed within the NOBID Consortium and carried forward under the name
**Digimaks**.

## Requirements

- iOS 15+
- Swift 5.9+ / Xcode 15+

## Installation

Add the package to your `Package.swift`:

```swift
.package(url: "<repository-url>", from: "1.0.0")
```

or add it in Xcode via **File → Add Package Dependencies…**.

## Overview

| Type | Responsibility |
| ---- | -------------- |
| `PasscodeManager` | Stores, updates and validates the app PIN; tracks failed attempts, lock-out state and the session token |
| `BiometricsManager` | Face ID / Touch ID evaluation, availability checks and the matching SF Symbol name |
| `FailedPinState` | Result of a PIN validation attempt |

The PIN is never stored in clear text: a random per-passcode salt is generated
and only an HKDF-SHA256 digest is written to the keychain, with
`kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly`. Validation re-derives the
digest and compares it in constant time.

## Dependencies

- `UtilitiesPackage`
- `KeychainWrapperPackage`

> These are referenced by relative path, so both packages must be checked out
> as siblings of this repository.

## Licence

Licensed under the [EUPL-1.2](LICENSE). See [Notice](Notice) for attribution.
