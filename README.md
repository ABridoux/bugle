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
bugle add -n UserDidFallAsleep -s /Users/homer/Desktop/ring.sh -f UserObservations.plist
```

#### Remove an observer

```bash
bugle remove -n UserDidFallAsleep -s /Users/homer/Desktop/ring.sh -f UserObservations.plist
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

## Script

It is required to add a shebang at the beginning of the script file.

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
