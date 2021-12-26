# Bugle

A simple command line tool to post and listen to distributed notifications to execute scripts.

## Usage

### Manage observations

**Bugle** uses Plist files to know what notifications to listen, and what scripts to execute when the notification is received.

A notification reception can execute several scripts as they are stored in an array. Here is an example.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>UserDidFallAsleep</key>
    <array>
        <string>/Users/homer/Desktop/ring.sh</string>
        <string>/Users/Shared/shower.sh</string>
    </array>
    <key>UserDidWakeUp</key>
    <array>
        <string>/Users/homer/Desktop/showTask.sh</string>
    </array>
</dict>
</plist>
```

When the notification "UserDidFallAsleep" is received, both */Users/homer/Desktop/ring.sh* and */Users/Shared/shower.sh* will be executed.
It's possible to edit a Plist file manually. Otherwise, **Bugle** offers two commands to add and remove an observer from a file.

#### Add an observer

```bash
bugle add \
    -n UserDidFallAsleep \
    -s /Users/homer/Desktop/ring.sh \
    -f UserObservations.plist
```

##### Registered domains

If the notification domain is registered, it's possible to specify the domain and rely on [auto-completion](#completion). The list of registered domains can be found [here](#domains). For instance with the registered domain "kerberos".

```bash
bugle add \
    -d kerberos -n ADPasswordChanged \
    -s /Users/homer/Desktop/ring.sh \
    -f KerberosObservations.plist
```

##### Script execution

It is required to add a shebang at the beginning of the script file.

#### Remove an observer

```bash
bugle remove \
    -n UserDidFallAsleep \
    -s /Users/homer/Desktop/ring.sh \
    -f UserObservations.plist
```

##### Registered domains

If the notification domain is registered, it's possible to specify the domain and rely on [auto-completion](#completion). The list of registered domains can be found [here](#domains). For instance with the registered domain "kerberos".

```bash
bugle remove \
    -d kerberos -n ADPasswordChanged \
    -s /Users/homer/Desktop/ring.sh \
    -f KerberosObservations.plist
```

### Listen

To start listening to notifications, run `bugle listen` with the observations file.

```bash
bugle listen -f UserObservations.plist
```

### Post

It's also possible to post notifications, whether it be to test the scripts execution or for another purpose.

```bash
bugle post -n UserDidFallAsleep
```

##### Registered domains

If the notification domain is registered, it's possible to specify the domain and rely on [auto-completion](#completion). The list of registered domains can be found [here](#domains). For instance with the registered domain "kerberos".

```bash
bugle post -d kerberos -n ADPasswordChanged
```

## Install

You can find a notarized version of the executable as both **PKG** or **ZIP** in the [releases](https://github.com/ABridoux/bugle/releases) section.

The following script will download the latest version and install it at */usr/local/bin/*.

```bash
curl -LO https://github.com/ABridoux/bugle/releases/latest/download/bugle.zip && \
unzip bugle.zip && \
rm bugle.zip && \
install bugle /usr/local/bin && \
rm bugle
```

### Completion

You can install the completion for **Bugle** by running `bugle install-completion-script`. You might have to source again your shell file or to restart the terminal.

If the completion script does not install properly, you can try to do it manually with with the command `bugle --generate-completion-script` by following this [guide](https://github.com/apple/swift-argument-parser/blob/main/Documentation/07%20Completion%20Scripts.md).

## Domains

**Bugle** tries to offer a less error-prone way to register to notifications. This is done by adding a domain to the register. This allows to specify a notification with auto-completion and remove the need to write the reverse DNS each time. You can find the list of registered domains by running `bugle domain` and the domain notification name and details with 

```bash
bugle domain [domain name]
```

### Registering a domain
**Bugle** is open-source, and anyone is welcome to offer a new domain record. This is done by providing a Swift file in the *Declarations* folder. This file will hold 3 pieces of information:
- a reference URL where the notifications list for the domain can be found
- the reverse DNS of the domain (e.g. "com.apple.KerberosPlugin")
- an array of the domain notifications. Each notification is a dictionary with the notification name and the details about when it is sent.

To hold those information, a `Domain` should be declared as a `static Domain` property in a `Domain` extension. The compiler will ensure no property is forgotten.  
 
Here is an example Swift file used for Kerberos (not exhaustive).

```swift
public static let kerberos = Domain(
    name: "kerberos",
    referenceURL: URL(string: "https://www.apple.com/business/docs/site/Kerberos_Single_Sign_on_Extension_User_Guide.pdf")!,
    reverseDNS: "com.apple.KerberosPlugin",
    notifications: [
        Notification(
            name: "ConnectionCompleted",
            details: "The Kerberos SSO extension has run its connection process."
        ),
        Notification(
            name: "ADPasswordChanged",
            details: "The user has changed the Active Directory password with the extension"
        )
    ]
```

### New domain record process

To add a new domain record, here is a process that you can follow.

1. Fork the project (upper-right corner button)
2. Create a new branch from "develop", naming it "feature/domain-record-[domain name]"
3. Add the Swift file in the folder *Sources/Bugle/Declarations*
4. Commit your changes and push them to your forked repository
5. Open a merge-request from your branch to "Bugle/develop" and assign [ABridoux](https://github.com/ABridoux) or tag me in the merge request comment.

From here, I'll take a look as soon as I can and merge your branch if the JSON has no errors. Otherwise, maybe I'll ask to make some modifications.
If you prefer, you can also [send me an email](mailto:alexis1bridoux@gmail.com) with the JSON file. I'll add it to the records.

The added domain record will then be bundled in the next release.

### Registered domains

- [Apple Kerberos Plugin](https://www.apple.com/business/docs/site/Kerberos_Single_Sign_on_Extension_User_Guide.pdf)
