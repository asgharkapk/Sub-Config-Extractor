# subconverter

A utility for converting between various subscription formats.

[![Build Status](https://github.com/metacubex/subconverter/actions/workflows/build.yml/badge.svg)](https://github.com/metacubex/subconverter/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/metacubex/subconverter.svg)](https://github.com/metacubex/subconverter/tags)
[![GitHub release](https://img.shields.io/github/release/metacubex/subconverter.svg)](https://github.com/metacubex/subconverter/releases)
[![GitHub license](https://img.shields.io/github/license/metacubex/subconverter.svg)](https://github.com/metacubex/subconverter/blob/master/LICENSE)

* * *

## New Content

2021/10/1

- Added descriptions to the `[advanced]` section of the [Configuration File](#Configuration File)
- Modified and adjusted several descriptions in the documentation
- Replaced broken external links in the documentation

<details>
<summary><b>Update History</b></summary>
2020/12/9

- Added descriptions to the `[Rule Conversion](#Rule Conversion](#Special Usage)` section of the [Configuration File](#Configuration File)
- Changed `clash_proxy_group` to `proxy_group` in the [Configuration File](#Configuration File) and added descriptions and examples for the changes
- Modified `[Configuration File](#Configuration File)` section of the [ ... Changed `surge_ruleset` in the `[ruleset]` section to `ruleset`, and added modification examples.
- Changed `surge_ruleset` to `ruleset` in [External Configuration](#External Configuration)
- Added `add_emoji` and `remove_old_emoji` in [External Configuration](#External Configuration)
- Modified the descriptions and examples for `proxy_group` and `ruleset` in [External Configuration](#External Configuration)
- Adjusted some descriptions in [Simple Usage](#Simple Usage) and [Advanced Usage](#Advanced Usage)
- Replaced broken external links in the documentation

2020/11/20

- Added `mixed` and `auto` parameters in [Supported Types](#Supported Types)
- Added descriptions for multiple call parameters in [Advanced Links](#Advanced Links)
- Added `Configuration Files](#Configuration Files) Added descriptions for the `[userinfo]` section in the `[configuration file]` section.
- Added descriptions for multiple parameters in `[common]`, `[node_pref]`, and `[server]` in the `[configuration file]` section.
- Modified the description for the `[url]` parameter in the `[advanced links]` section.

2020/04/29

- Added a `[configuration file]` section to specify a default external configuration file.
- Added a description for the `[aliases]` parameter in the `[configuration file]` section.
- Added a description for the `[template function]` interface for direct rendering in the `[template function]` section.
- Modified the description for TG-like nodes in the `[supported types]` section.
- Changed `[template description]` to `[template function]`.

2020/04/04

- Added a `[template description]` section to allow for highly customized `[base]` templates.
- Added Added a description for the `[template]` parameter in the [Configuration File](#Configuration File)
- Added a description for the `[template]` parameter in the [External Configuration](#External Configuration)
- Added a `[Local Generation](#Local Generation)` parameter for generating specific configuration files locally
- Added the `mellow` and `trojan` parameters in the [Support Types](#Support Types)
- Added a description for the `new_name` parameter in the [Advanced Links](#Advanced Links)
- Added descriptions for the `append_sub_userinfo` and `clash_use_new_field_name` parameters in the [Configuration File](#Configuration File)
- Adjusted the hierarchy of the [Table of Contents](#Table of Contents)

2020/03/02

- Added descriptions for the `append_type`, `append_info`, `expand`, `dev_id`, `interval`, and `strict` parameters in the [Advanced Links](#Advanced Links)

</details>

* * *

## Help Table of Contents

- [Subconverter](#Subconverter)

- [New Content](#New Content)

- [Handbook](#Handbook)

- [Supported Types](#Supported Types)

- [Simple Usage](#Simple Usage)

- [Calling Address](#Calling Address)
- [Calling Instructions](#Calling Instructions)
- [Simple Conversion](#Simple Conversion)

- [Advanced Usage](#Advanced Usage)

- [Pre-Reading Tips](#Pre-Reading Tips)

- [Advanced Links](#Advanced Links)

- [Calling Address (Advanced)](#Calling Address - Advanced)
- [Calling Instructions (Advanced)](#Calling Instructions - Advanced)

- [Configuration File](#Configuration File)

- [Calling Address (File)](#Calling Address - File)
- [Calling Instructions (File)](#Calling Instructions - File)

- [Configuration File](#Configuration File)

- [External Configuration](#External Configuration)

- [Template Function](#Template Function)

- [Template Call](#Template Call)
- [Direct Rendering](#Direct Rendering)

- [Special Usage](#Special Usage)

- [Local Generation](#Local Generation)

- [Automatic Upload](#Automatic Upload)

- [Rule Conversion](#Rule Conversion)

- [Call Address (Rule Conversion)](#Call Address - Rule Conversion)
- [Call Description (Rule Conversion)](#Call Description - Rule Conversion)

## Supported Types

| Type | As Source Type | As Target Type | Parameters |
| ---------------------- | :---: | :----: | -------------- |
| Clash | ✓ | ✓ | clash |
| ClashR | ✓ | ✓ | clashr |
| Quantumult (Full Configuration) | ✓ | ✓ | quan |
| Quantumult X (Full Configuration) | ✓ | ✓ | quanx |
| Loon | ✓ | ✓ | loon |
| Mellow | ✓ | ✓ | mellow |
| SS (SIP002) | ✓ | ✓ | ss |
| SS (Software Subscription/SIP008) | ✓ | ✓ | sssub |
| SSD | ✓ | ✓ | ssd |
| SSR | ✓ | ✓ | ssr |
| Surfboard | ✓ | ✓ | surfboard |
| Surge 2 | ✓ | ✓ | surge&ver=2 |
| Surge 3 | ✓ | ✓ | surge&ver=3 |
| Surge 4 | ✓ | ✓ | surge&ver=4 |
| Trojan | ✓ | ✓ | trojan |
| V2Ray | ✓ | ✓ | v2ray |
| HTTP/Socks link for TG-like proxy | ✓ | × | Only supports `&url=` call |
| Mixed | × | ✓ | mixed |
| Auto | × | ✓ | auto |

Note:

1. Shadowrocket users can use the `ss`, `ssr`, `v2ray`, and `mixed` parameters.

2. Since HTTP/Socks links like TG proxies don't have naming settings, you can add `&remarks=` after the link to set the name. You can also add `&group=` to set the group name. Both parameters must be [URLEncode](https://www.urlencoder.org/). For example:

- tg://http?server=1.2.3.4&port=233&user=user&pass=pass&remarks=Example&group=xxx
- <https://t.me/http?server=1.2.3.4&port=233&user=user&pass=pass&remarks=Example&group=xxx>

3. The target type is When `mixed` is used, a standard subscription consisting of a single link to all supported nodes (Base64-encoded) will be output.

4. When the target type is `auto`, the output target type is automatically determined based on the request's `User-Agent`. The matching rules can be found [here](https://github.com/metacubex/subconverter/blob/master/src/handler/interfaces.cpp#L121) (This link may not accurately point to the corresponding code due to code changes).

* * *

## Simple Usage

> This generates a subscription using **default settings**

### Calling URL

```txt
http://127.0.0.1:25500/sub?target=%TARGET%&url=%URL%&config=%CONFIG%
```

### Calling Instructions

| Calling Parameters | Required |
Example | Explanation |
| ------ | :-: | :------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| target | Required | surge&ver=4 | Specifies the configuration type you want to generate. See the parameters in [Supported Types](#Supported Types) above for details. |
| url | Required | https%3A%2F%2Fwww.xxx.com | Specifies the subscription link or proxy node sharing link provided by the airport. This link must be URLEncoded. |
| config | Optional | https%3A%2F%2Fwww.xxx.com | Specifies the external configuration URL (including the grouping and rule sections). This link must be URLEncoded. See [External Configuration](#External Configuration) for details. If this parameter is not present, the configuration file in the main program directory is used. |

After running the subconverter main program, follow the [Invocation Instructions](#Invocation Instructions). Replace the corresponding content with the content in the .txt file to create a subscription with the **default settings**.

Because this section is quite long, click the entry below for a detailed explanation:

<details>
<summary><b>Processing a Single Subscription</b></summary>

If you need to convert a Surge subscription to a Clash subscription, you can do so as follows:

```txt
You have the following subscription and want to convert it to a Clash subscription:
1. https://dler.cloud/subscribe/ABCDE?surge=ss

First, URLEncode the subscription to get:
https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fsurge%3Dss

Then combine the desired %TARGET% (i.e., Clash) with the %URL% obtained in the previous step. Enter the following URL:
http://127.0.0.1:25500/sub?target=clash&url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fsurge%3Dss

Finally, enter this link in the Clash subscription section and you're done. 
```

</details>

<details>
<summary><b>Handling Multiple Subscriptions</b></summary>

If you need to combine multiple subscriptions into one, use a '|' before the URLEncode function mentioned above to separate the links. You can do this as follows:

```txt
I have the following two subscriptions that I want to combine and convert into a Clash subscription:
1. https://dler.cloud/subscribe/ABCDE?clash=vmess
2. https://rich.cloud/subscribe/ABCDE?clash=vmess

First, use a '|' to separate the two subscriptions:
https://dler.cloud/subscribe/ABCDE?clash=vmess|https://rich.cloud/subscribe/ABCDE?clash=vmess

Then use URLEncode to You'll get:
https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess%7Chttps%3A%2F%2Frich.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess

Then, fill in the desired %TARGET% (i.e., Clash) and the %URL% obtained in the previous step into the call address:
http://127.0.0.1:25500/sub?target=clash&url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess%7Chttps%3A%2F%2Frich.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess

Finally, enter this link into the Clash subscription section, and you're done. 
```

</details>

<details>
<summary><b>Processing a Single Link</b></summary>

If you need to convert a self-built SS SIP002 link into a Clash subscription, you can follow these steps:

```txt
I have the following self-built SS SIP002 link and want to convert it into a Clash subscription:
1. ss://YWVzLTEyOC1nY206dGVzdA==@192.168.100.1:8888#Example1

First, pass the subscription URL to the URLEncode You'll get:
ss%3A%2F%2FYWVzLTEyOC1nY206dGVzdA%3D%3D%40192%2E168%2E100%2E1%3A8888%23Example1

Then, enter the desired %TARGET% (i.e., Clash) and the %URL% obtained in the previous step into the call address:
http://127.0.0.1:25500/sub?target=clash&url=ss%3A%2F%2FYWVzLTEyOC1nY206dGVzdA%3D%3D%40192%2E168%2E100%2E1%3A8888%23Example1

Finally, enter this link into the Clash subscription section, and you're done. 
```

</details>

<details>
<summary><b>Handling Multiple Links</b></summary>

If you need to combine multiple links into one, use '|' before the URLEncode function mentioned above to separate the links. You can do this as follows:

```txt
I have the following two links and want to combine them into a Clash subscription:
1. ss://YWVzLTEyOC1nY206dGVzdA==@192.168.100.1:8888#Example1
2. vmess://eyJ2IjoiMiIsInBzIjoidm1lc3MtcHJveHkxIiwiYWRkIjoiZXhhbXBsZS5jb20iLCJwb3J0Ijo0NDMsInR5cGUiOiIiLCJpZCI6IjEyMzQ1Njc4LWFiY2QtMTIzNC0xMjM0LTQ3ZmZjYTBjZTIyOSIsImFpZCI6NDQzLCJuZXQiOiJ3cyIsInBhdGgiOiIvdjIiLCJob3N0IjoiZXhhbXBsZS5jb20iLCJ0bHMiOiJ0bHMifQ==

First, use '|' Separate the two links:
ss://YWVzLTEyOC1nY206dGVzdA==@192.168.100.1:8888#Example1|vmess://eyJ2IjoiMiIsInBzIjoidm1lc3MtcHJveHkxIiwiYWRkIjoiZXhhbXBsZS5jb20iLCJwb3J0Ijo0NDMsInR5cGU iOiIiLCJpZCI6IjEyMzQ1Njc4LWFiY2QtMTIzNC0xMjM0LTQ3ZmZjYTBjZTIyOSIsImFpZCI6NDQzLCJuZXQiOiJ3cyIsInBhdGgiOiIvdjIiLCJob3N0IjoiZXhhbXBsZS5jb20iLCJ0bHMiOiJ0bHMifQ==

Then use URLEncode After that you can get:
ss%3A%2F%2FYWVzLTEyOC1nY206dGVzdA%3D%3D%40192%2E168%2E100%2E1%3A8888%23Example1%7Cvmes s%3A%2F%2FeyJ2IjoiMiIsInBzIjoidm1lc3MtcHJveHkxIiwiYWRkIjoiZXhhbXBsZS5jb20iLCJwb3J0Ijo0 NDMsInR5cGUiOiIiLCJpZCI6IjEyMzQ1Njc4LWFiY2QtMTIzNC0xMjM0LTQ3ZmZjYTBjZTIyOSIsImFpZCI6NDQzLCJuZXQiOiJ3cyIsInBhdGgiOiIvdjIiLCJob3N0IjoiZXhhbXBsZS5jb20iLCJ0bHMiOiJ0bHMifQ%3D%3D

Then combine the desired %TARGET% (i.e., Clash) with the %URL% obtained in the previous step. Enter the calling URL:
http://127.0.0.1:25500/sub?target=clash&url=ss%3A%2F%2FYWVzLTEyOC1nY206dGVzdA%3D%3D%40192%2E168%2E100%2E1%3A8888%23Example1%7Cvmess%3A%2F%2FeyJ2IjoiMiIsInBzIjoidm1lc3MtcHJveHkxIiwiYWRkIjoiZXhhbXB sZS5jb20iLCJwb3J0Ijo0NDMsInR5cGUiOiIiLCJpZCI6IjEyMzQ1Njc4LWFiY2QtMTIzNC0xMjM0LTQ3ZmZjYTBjZTIyOSIsImFpZCI6NDQzLCJuZXQiOiJ3cyIsInBhdGgiOiIvdjIiLCJob3N0IjoiZXhhbXBsZS5jb20iLCJ0bHMiOiJ0bHMifQ%3D%3D

Finally, enter this link into the Clash subscription section and you're done. 
```

</details>

### Simple Conversion

If the airport's Surge configuration is sufficient but you need a Clash subscription, you can use the following method to convert it.

```txt
http://127.0.0.1:25500/surge2clash?link=Surge's subscription link
```

The `Surge subscription link` here does not require URL encoding and no additional configuration is required.

* * *

## Advanced Usage

> If you are not satisfied with the default rules or groupings provided by this program, you can consider trying advanced usage.
>
> Customize the `call address` or even the `configuration file` in the program directory to meet your specific needs.

### Pre-reading Notes

Before proceeding, we strongly recommend reading the following:

1. Regarding the call address: [What is a URL?] ](https://developer.mozilla.org/zh-CN/docs/Learn/Common_questions/What_is_a_URL)
2. Configuration file related: [INI syntax introduction](https://zh.wikipedia.org/wiki/INI%E6%96%87%E4%BB%B6), [YAML syntax introduction](https://zh.wikipedia.org/wiki/YAML#%E8%AA%9E%E6%B3%95), and [TOML syntax introduction](https://toml.io/cn/v1.0.0)
3. Clash configuration related: [YAML syntax introduction](https://zh.wikipedia.org/wiki/YAML#%E8%AA%9E%E6%B3%95) and [official documentation](https://github
.com/Dreamacro/clash/wiki/configuration)
4. Template configuration related: [INJA Syntax Introduction](https://github.com/pantor/inja)
5. Frequently used: [Regular Expression Basics](https://github.com/ziishaned/learn-regex/blob/master/translations/README-cn.md)
6. When you encounter problems and need to submit an issue: [How to Ask Questions - The Smart Way](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/master/README-zh_CN.md)

When attempting advanced operations, it is assumed that you have the required capabilities. This program is only guaranteed to function properly with the default configuration file.

### Advanced Links

#### Calling URL (Advanced)

```txt
http://127.0.0.1:25500/sub?target=%TARGET%&url=%URL%&emoji=%EMOJI%····
```

#### Calling Instructions (Advanced)

| Calling Parameters | Required | Example | Explanation |
| ------------- | :-: |:--------------------------| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| target | Required | surge&ver=4 | Specifies the configuration type to generate. See the parameters in [Supported Types](#Supported Types) above for details. |
| url | Optional | https%3A%2F%2Fwww.xxx.com | Specifies the subscription link provided by the airport or the shared link of the proxy node. It must be [URLEncoded](https://www.urlencoder.org/) Processing, **optional prerequisite is to specify `default_url`**. Data URI can also be used. Use `tag:xxx,https%3A%2F%2Fwww.xxx.com` to specify that all nodes in this subscription belong to the `xxx` group. This is used to match `!!GROUP=XXX` in the configuration file. |
| group | Optional | MySS | Used to set the group name for this subscription. This is mostly used for SSD/SSR. |
| upload_path | Optional | MySS.yaml | Used to specify the name of the generated subscription file after uploading it to `Gist`. This file must be URLEncoded. |
| include | Optional | See `include_remarks` below for details. | This only retains matching nodes. This supports regular expression matching and requires URLEncoding. This overrides the configuration file settings. |
| exclude | Optional | See `exclude_remarks` below for details. | This excludes matching nodes. This supports regular expression matching and requires URLEncoding. URLEncode processing will override the configuration file settings. |
| config | Optional | https%3A%2F%2Fwww.xxx.com | Refers to the external configuration address (including the group and rule components), which needs to be URLEncoded. See [External Configuration](#External Configuration) for details. If this parameter is not present, the configuration file in the main program directory is used. |
| dev_id | Optional | 92DSAFA | Used to set the remote device ID of QuantumultX, which enables remote scripting on certain versions. |
| filename | Optional | MySS | Specifies the file name of the generated subscription, which can be displayed in software that supports file names, such as Clash For Windows. |
| interval | Optional | 43200 | Used to set the managed configuration update interval, which determines how long the configuration will be updated, in seconds. |
| rename | Optional | See `rename` below for details. | Used for custom renaming, which requires `rename``. URLEncode processing will override the configuration file settings. |
| filter_script | Optional | See `filter_script` below for details. | JS code used for custom filtering nodes. This code must be URLEncoded and will override the configuration file settings. For security reasons, the link must contain the correct `token` parameter for this setting to apply. |
| strict | Optional | true / false | If set to true, Surge will force an update after the specified interval. |
| upload | Optional | true / false | Used to upload the generated subscription file to `Gist`. Requires `gistconf.ini`. Defaults to false (no upload). See [Auto Upload](#Auto Upload) for details. |
| emoji | Optional | true / false | Used to set whether the node name contains emojis. Defaults to true. |
| add_emoji | Optional | true / false | Used to add emojis to the node name. Defaults to true.
|
| remove_emoji | Optional | true / false | Used to set whether to remove existing emojis from node names. Defaults to true. |
| append_type | Optional | true / false | Used to insert the node type before the node name, such as `[SS]`, `[SSR]`, etc. |
| tfo | Optional | true / false | Used to enable TCP Fast Open for this subscription link. Defaults to false. |
| udp | Optional | true / false | Used to enable UDP for this subscription link. Defaults to false. |
| list | Optional | true / false | Used to output Surge Node List, Clash Proxy Provider, or Quantumult (X) node subscriptions or decoded SIP002. |
| sort | Optional | true / false | Used to re-sort the output nodes or policy groups by node name. Defaults to false. |
| sort_script | Optional | See `sort_script` below for details. | JS code for custom sorting. Requires [URLEncode](https://www.urlencoder.org/) Processing will overwrite the settings in the configuration file. For security reasons, this setting will only be applied if the link contains the correct `token` parameter. |
| script | optional | true / false | Used to generate Clash scripts. Defaults to false. |
| insert | optional | true / false | Used to set whether to insert `insert_url` from the configuration file. Defaults to true. |
| scv | optional | true / false | Used to disable certificate checking for TLS nodes. Defaults to false. |
| fdn | optional | true / false | Used to filter nodes whose target type is not supported. Defaults to true. |
| expand | optional | true / false | Used to process or convert Surge, QuantumultX, or Clash rule lists on the API side. Whether to include the full text of the rules in the subscription. Defaults to true. Setting this to false does not include the full text of the rules in the subscription. |
| append_info | optional | true / false | Used to output nodes containing traffic or expiration information. Defaults to true. Setting this to false suppresses the output. |
| prepend | optional | true / false | Used to set the `insert_url` to be inserted. Whether to insert it before all nodes when creating a new proxy. Defaults to true. |
| classic | Optional | true / false | Used to set whether to generate the Clash classical rule-provider. |
| tls13 | Optional | true / false | Used to set whether to add the TLS 1.3 enablement parameter for the node. |
| new_name | Optional | true / false | If set to true, Clash's new group name (proxies, proxy-groups, rules) will be enabled. |
| ua | Optional | shadowrocket%2F2.2.65 | Used to customize the User-Agent string. Requires [URLEncode](https://www.urlencoder.org/). If not specified, the default User-Agent will be used.

For example:

```txt
I have a subscription called `https://dler.cloud/subscribe/ABCDE?clash=vmess` and want to convert it to a Surge 4 subscription. I need to enable Transient Forwarding (TFO) and UDP.

Add EMOJI to the node name and exclude the node that displays traffic and the official website in the subscription (node ​​names are "Remaining Traffic: 1024G" and "Official Website Address: dler.cloud").

First, confirm the required parameters:

target=surge&ver=4, tf
o=true, udp=true, emoji=true, exclude=(traffic|official website)
url=https://dler.cloud/subscribe/ABCDE?clash=vmess

The URL will then need to be URLEncoded. Process the following:
exclude=%28%E6%B5%81%E9%87%8F%7C%E5%AE%98%E7%BD%91%29
url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess

Then concatenate all the elements:
http://127.0.0.1:25500/sub?target=surge&ver=4&tfo=true&udp=true&emoji=true&exclude=%28%E6%B5%81%E9%87%8F%7C%E5%AE%98%E7%BD%91%29&url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess

Finally, enter this link into Surge The subscription is complete.
```

**Example of using a custom User-Agent:**

```txt
I have a subscription to `https://example.com/subscribe` and want to convert it to a Clash subscription, specifying the User-Agent as `shadowrocket/2.2.65`.

First, confirm the required parameters:

target=clash, ua=shadowrocket/2.2.65

url=https://example.com/subscribe

Then, process the URL-encoded portion:

ua=shadowrocket%2F2.2.65

url=https%3A%2F%2Fexample.com%2Fsubscribe

Then concatenate all the elements:

http://127.0.0.1:25500/sub?target=clash&ua=shadowrocket%2F2.2.65&url=https%3A%2F%2Fexample.com%2Fsubscribe

This will use the specified User-Agent string when retrieving the subscription.
```

### Configuration Files

> After configuring your subscription link using the [Advanced Links](#Advanced Links) section above, it can often become very long and difficult to remember. In this case, consider using a configuration file.

This function currently only supports reading local files.

#### Calling URL (File)

```txt
http://127.0.0.1:25500/getprofile?name=%NAME%&token=%TOKEN%
```

#### Calling Instructions (File)

| Calling Parameters | Required | Example | Explanation |
| ----- | :-: | :------------------------ | :------------------------------------------------------------- |
| name | Required | profiles/formyairport.ini | Specifies the storage location of the configuration file (a relative location based on the **pref configuration file** can be used) |
| token | Required | passwd | For security reasons, a token must be set (see the description of `api_access_token` in the `[common] section of [Configuration Files](#Configuration Files) for details). |

Note that the parameters in this file do not need to be URL-encoded, and `token` is not the same as `formyairport.ini`. The `api_mode` state is irrelevant.

Create a new document file anywhere in the program directory (it's recommended to save it in the `profiles` folder to keep the directory tidy and facilitate subsequent maintenance), such as `formyairport.ini`, and fill it in according to the configured parameters in the [example document](https://github.com/metacubex/subconverter/blob/master/base/profiles/example_profile.ini).

<details>
<summary>For example:</summary>

Using the example in the [Advanced Link](#Advanced Link) above, the contents of `formyairport.ini` should be:

```txt
[Profile]
url=https://dler.cloud/subscribe/ABCDE?clash=vmess
target=surge
surge_ver=4
tfo=true
udp=true
emoji=true
exclude=(traffic|official website)
```

After editing and saving `formyairport.ini`, you can access it using `http://127.0.0.1:25500/getprofile?name=profiles/formyairport.ini&token=passwd`.


</details>

### Configuration File

> Regarding the `pref.ini` file in the subconverter main program directory, other configuration files are similar and will not be discussed here.

Note: This section is based on the [`pref.example.ini`](https://github.com/metacubex/subconverter/blob/master/base/pref.example.ini) or [`pref.example.yml`](https://github.com/metacubex/subconverter/blob/master/base/pref.example.yml) or [`pref.example.toml`](https://github.com/metacubex/subconverter/blob/master/base/pref.example.toml) included with this program. This document may not be updated in a timely manner and its content may not be applicable to new versions.

When loading configuration files, the highest priority configuration file is loaded in the order of `pref.toml`, `pref.yml`, and `pref.ini`.

Because this section is quite long, click the entry below for a detailed explanation:

<details>
<summary><b>[common] Section</b></summary>

> This section primarily covers **global node exclusion or retention** and **basics for each configuration file**
>
> Other settings can be left at their defaults or modified if you understand their impact.

1. **api_mode**

> API mode. Setting this to true prevents directly loading local subscriptions or serving local files. Accessing these contents requires appending `&token=`. (Mostly used when deploying a public subscription conversion service.)

- If the value is `false`, the configuration file in the main application directory will be read with each configuration update. If `true`, it will only be read at startup.

2. **api_access_token**

> Used to access relatively private APIs (such as `/getprofile`)

- For example:

```ini
api_access_token=passwd
```

3. **default_url**

> When no %URL% parameter is specified, the default subscription link is loaded. **URLEncoding is not required**.
>
> If there are multiple links, they still need to be separated by "|". Both `file` and `url` are supported.

- For example:

```ini
default_url=https://dler.cloud/subscribe/ABCDE?clash=vmess
```

- Explanation:

```txt
The subscription link at this time is:

http://127.0.0.1:25500/sub?target=clash
Equivalent to:

http://127.0.0.1:25500/sub?target=clash&url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fclash%3Dvmess
```

4. **enable_insert**

> Sets whether to add all nodes in `insert_url` to the output subscription.

- When the value is `true`, all nodes in `insert_url` are added to the output subscription. When `false` is set, all nodes in `insert_url` are added to the output subscription. Not added.

5. **insert_url**

When `enable_insert` is set to `true`, the node added before the subscription is added, regardless of whether the %URL% parameter is present. **URLEncoding is not required**.
>
> If there are multiple nodes, they still need to be separated by "|". `Single Node`/`Subscription Link` are supported.

> > Supports SS/SSR/Vmess and HTTP/Socks links for TG-like proxies.

- For example:

```ini
insert_url=ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpwYXNzd29yZA@www.example.com:1080#Example
insert_url=ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpwYXNzd29yZA@www.example.com:1080#Example
```

6. **prepend_insert_url**

> Sets whether to add the node specified in `insert_url` to the front of all nodes when adding the node to the output subscription.

- When the value is `true`, All nodes in `insert_url` will be added before all nodes in the output subscription. If `false` is set, they will be added after them.

7. **exclude_remarks**

Excludes matching nodes. Supports regular expression matching.

- Example:

```ini
exclude_remarks=(expired|remaining traffic|time|official website|product|platform)
```

8. **include_remarks**

Retains only matching nodes. Supports regular expression matching.

- Example:

```ini
include_remarks=(?<=US).*(BGP|GIA|IPLC)
```

9. **enable_filter**

Sets all nodes to use custom JS code for filtering.

- When `true` is set, the custom JS code is used for filtering for all nodes. When `false` is set, it is disabled.

10. **filter_script**

> Filter all nodes using a custom JavaScript function
>
> Can be set to JavaScript code or a path to a local JavaScript file
>
> The JavaScript function takes one parameter, a node. If the function returns true, the node is retained; if it returns false, the node is discarded.

- Example:

```ini
# Only retain nodes encrypted with Chacha20

filter_script
pt = function filter(node) {\n if(node.EncryptMethod.includes('chacha20'))\n return true;\n return false;\n}
# Or use a local file
filter_script="path:/path/to/script.js"
```

- The node object contains all the node information. For a detailed structure, see [here](https://github.com/netchx/netch/blob/268bdb7730999daf9f27b4a81cfed5c36366d1ce/GSF.md)

11. **default_external_config**

> If no external configuration file is specified, it is set to the default. Both `local file` and `online URL` are supported.

- For example:

```ini
default_external_config=config/example_external_config.ini
```

12. **base_path**

> Limits the base path of local configuration files that can be used by external configuration.

- For example:

```ini
base_path=base
#External configuration can only use the local configuration files in the base folder as a base.
```

13. **clash_rule_base**

> Generated Clash configuration file template. Supports `local file` and `online URL`

- For example:

```ini
clash_rule_base=base/GeneralClashConfig.yml # Load a local file as a template
# Or
clash_rule_base=https://github.com/ACL4SSR/ACL4SSR/raw/master/Clash/GeneralClashConfig.yml
# Load the relevant file from ACL4SSR's Github repository as a template
```

14. **surge_rule_base**

> Generated Surge configuration file template, usage is the same as above

15. **surfboard_rule_base**

> Generated Surfboard configuration file template, usage is the same as above

16. **mellow_rule_base**

> Generated Mellow configuration file template, usage is the same as above

17. **loon_rule_base**

> Generated Loon configuration file template, usage is the same as above

18. **sssub_rule_base**

> Generated sssub configuration file template, usage is the same as above.

19. **proxy_config**

> Whether to use a proxy when updating an external configuration file.

> Fill `NONE` or leave it blank to disable, or fill `SYSTEM` to use the system proxy.

> > Supports HTTP or SOCKS proxies (http://https://socks4a://socks5://).

> > Supports CORS proxies (cors://). For details, see [cors-anywhere](https://github.com/Rob--W/cors-anywhere) and [cloudflare-cors-anywhere](https://github.com/Zibri/cloudflare-cors-anywhere).

- For example:

```ini
proxy_config=SYSTEM # Use the system proxy.
# Or
proxy_config=socks5://127.0.0.1:1080 # Use local port 1080 for SOCKS5 proxy.
# or
proxy_config=cors:https://cors-anywhere.herokuapp.com/ # Use CORS proxy
```

20. **proxy_ruleset**

> Whether to use a proxy when updating rules. Usage: same as above.

21. **proxy_subscription**

> Whether to use a proxy when updating an original subscription. Usage: same as above.

22. **append_proxy_type**

> Whether to include attributes in the node name. When set to true, add \[SS] \[SSR] \[VMess] to the beginning of the node name to distinguish it.
>
> Defaults to false

- Example (when set to true):

```txt
[SS] Hong Kong Transit
[VMess] GIA USA
```

</details>
<details>
<summary><b>[userinfo] Summary

> This section primarily covers **Rules for extracting user information from node names**
>
> It is recommended to keep the default settings or modify them only after understanding their intended purpose.

1. **stream_rule**

> Rules for extracting and displaying traffic information from node names
>
> Usage: Regular expression for extracting information from nodes | Regular expression for displaying information

- Example:

```ini
stream_rule=^Remaining traffic: (.*?)\|Total traffic: (.*)$|total=$2&left=$1
stream_rule=^Remaining traffic: (.*?) (.*)$|total=$1&left=$2
stream_rule=^Bandwidth: (.*?)/(.*)$|used=$1&total=$2
stream_rule=^\[.*?\]Remaining(.*?)@(?:.*)$|total=$1
stream_rule=^.*?Flow:(.*?) Remaining:(?:.*)$|total=$1
```

2. **time_rule**

> Rule for extracting time information from node names
>
> Usage: Regular expression for extracting information from nodes | Regular expression for displaying information

- Example:

```ini
time_rule=^Expiration time:(\d+)-(\d+)-(\d+) (\d+):(\d+):(\d+)$|$1:$2:$3:$4:$5:$6
time_rule=^Expiration time (:|:)(\d+)-(\d+)-(\d+)$|$1:$2:$3:0:0:0
time_rule=^Smart Access expire: (\d+)/(\d+)/(\d+)$|$1:$2:$3:0:0:0
time_rule=^.*? Traffic:(?:.*?) Remaining:(.*)$|left=$1d
```

</details>
<details>
<summary><b>[node_pref] Section</b></summary>

> This section mainly covers **Enabling UDP and TCP Fast Open for the node**, **Node Renaming**, and **Node Ordering after Renaming**

> It is recommended to keep the relevant settings at their defaults or modify them only if you understand their purpose.

1. **udp_flag**

> Enables UDP mode for the node. Set to true to enable. Default is false.

- **Do not adjust this setting if you are unsure of the airport's settings**.

2. **tcp_fast_open_flag**

> Enables TFO (TCP Fast Open) mode for the node. Set to true to enable. Default is false.

- **Do not adjust this setting if you are unsure of the airport's settings**. 3. **skip_cert_verify_flag**

> Disables TLS node certificate checking. Enables when set to true. Defaults to false.

- **Do not change this setting to true at will**

4. **tls13_flag**

> Adds a TLS 1.3 enable parameter to the node. Enables when set to true. Defaults to false.

- **Do not change this setting to true at will**

5. **sort_flag**

> Sorts nodes in generated subscriptions by name in A-Z order. Enables when set to true. Defaults to false.

6. **sort_script**

> Sorts nodes in generated subscriptions by a custom JS function.

> Can be set to JS code or a path to a local JS file.

> The JS function takes two parameters, namely two nodes. If the function returns true, node a is sorted before node b.

> For details, refer to the **filter_script** section in the `[common]` section.

- For example:

```ini
sort_script = function compare(node_a, node_b) {\n return node_a.Remark > node_b.Remark;\n}
# or
sort_script = "path:/path/to/script.js"
```

7. **filter_deprecated_nodes**

> Exclude node types not currently supported by **`target=`**. Enabled when set to true. Defaults to false.

- Consider setting this to true to avoid compatibility issues to a certain extent.

8. **append_sub_userinfo**

> Add traffic information to the header (so applications like Quanx and Surge can display traffic information notifications after reading it). Enabled when set to true. Defaults to true.

9. **clash_use_new_field_name**

> Enables Clash's new block name (proxies, proxy-groups, rules). Enabled when set to true. Defaults to true.

- Clash core started using new block names in version v0.19.0. Currently, v0.19.0 and above are widely used. Do not disable this unless you are certain you are using an extremely old version.

10. **clash_proxies_style**

> The style of proxy generation in the Clash configuration file
>
> Possible values ​​are `block`, `flow`, and `compact`. The default is `flow`.

- Style Example:

```yaml
Block:
- name: name1
key: value
- name: name2
key: value
Flow:
- {name: name1, key: value}
- {name: name2, key: value}
Compact:
[{name: name1, key: value},{name: name2, key: value}]
```

11. **rename_node**

> Renames a node, supports regular expression matching
>
> Usage: Original name@rename
>
> You can use a custom JS function for renaming
>
> For details, refer to the introduction in **filter_script** in the `[common]` section.

- Example:

```ini
rename_node=中国@中
rename_node=\(?((x|X)?(\d+)(\.?\d+)?)((\s?Multiplier?:?)|(x|X))\)?@(Multiplier:$1)
rename_node=!!script:function rename(node) {\n const geoinfo = JSON.parse(geoip(node.Hostname));\n if(geoinfo.country_code == "CN")\n return "CN " + node.Remark;\n}
rename_node=!!script:path:/path/to/script.js
```

- Special Usage:

```ini
rename_node=!!GROUPID=0!!中国@中
# Specifies that this rename only takes effect on the first subscribed node.
```

</details>
<details>
<summary><b>[managed_config] Section</b></summary>

> This section primarily addresses **update addresses for subscription files**

1. **write_managed_config**

> Whether to append the '#!MANAGED-CONFIG' information to the Surge or Surfboard configuration. Enabled when set to true, defaults to true.

2. **managed_config_prefix**

> Specific '#!MANAGED-CONFIG' information. The address prefix does not need to be prefixed with a "/".
>
> Surge or Surfboard will send update requests to this address, and the local ruleset URL will use this to generate /getruleset links.
>
> LAN users need to change this to the LAN IP address of the device running this program.

- Example:

```ini
managed_config_prefix = http://192.168.1.5:25500
```

3. **config_update_interval**

> Managed configuration update interval, determines how often the configuration will be updated, in seconds.

- Example:

```ini
config_update_interval = 86400
# Update every 86400 seconds (i.e., one day)
```

4. **config_update_strict**

> If config_update_strict is true, Surge will force an update after the specified interval.

5. **quanx_device_id**

> Used to override the device ID in the Quantumult X remote JS. This ID is found in the Quantumult X settings.

- For example:

```ini
quanx_device_id = XXXXXXX
```

</details>
<details>
<summary><b>[surge_external_proxy] section</b></summary>

> Adds a SSR support path for Surge

</details>
<details>
<summary><b>[emojis] section</b></summary>

1. **add_emoji**

> Whether to add the following custom emoji to the node name. Enabled when set to true. Defaults to true.

2. **remove_old_emoji**

> Whether to remove the emojis in the original subscription. Enabled when set to true. Defaults to true.

3. **rule**

> Add custom emojis before the matched node. Regular expression matching is supported.

- For example:

```ini
rule=(traffic|time|emergency),⌛time
rule=(US|United States),🇺🇸
```

- Special usage:

```ini
rule=!!GROUPID=0!!(traffic|time|emergency),⌛time
# Specifies that this emoji rule only applies to the first subscribed node.
```

</details>
<details>
<summary><b>[ruleset] section</b></summary>

> If you are not satisfied with the rules that come with the subscription, you can use the following configuration.

1. **enabled**

> Enables the custom rule set. Set to true. Defaults to true.

2. **overwrite_original_rules**

> Overwrites the original rules, i.e., the rules in `[common]`. The contents of xxx_rule_base are enabled when set to true, and are false by default.

3. **update_ruleset_on_request**

> Update the rule set upon request. Enabled when set to true, and are false by default.

4. **ruleset**

> Get a rule fragment from a local directory or URL.

> The format is `Group name,[type:]URL[,interval]` or `Group name,[]Rule`.

> Supported types include: surge, quanx, clash-domain, clash-ipcidr, and clash-classic.

> Leaving `type` blank defaults to a surge type rule.

> Text after the `\[]` prefix is ​​treated as a rule, not a link or path. This primarily includes `[]GEOIP` and `[]MATCH` (equivalent to `[]FINAL`).

- For example:

```ini
ruleset=🍎 Apple Services, https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list
# References the rule https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list
# Targets this rule to the 🍎 Apple Services policy group set by [proxy_group]
ruleset=Domestic Services, clash-domain: https://ruleset.dev/clash_domestic_services_domains, 86400
# References the clash-domain rule https://ruleset.dev/clash_domestic_services_domains
# Sets the rule update interval to 86400 seconds
# Targets this rule to the Domestic Services policy group set by [proxy_group]
ruleset=🎯 Global Direct Connection, rules/NobyDa/Surge/Download.list
# References the local rules in rules/NobyDa/Surge/Download.list
# Targets this rule to the 🎯 Global Direct Connection policy group set by [proxy_group]
ruleset=🎯 Global Direct Connection,[]GEOIP,CN
# Targets all China IPs in GEOIP
# Targets this rule to the 🎯 Global Direct Connection policy group set by [proxy_group]
ruleset=!!import:snippets/rulesets.txt
# Targets the local rules in snippets/rulesets.txt
```

</details>

<details>
<summary><b>[proxy_group] section</b></summary>

> Create a policy group for programs like Clash, Mellow, Surge, and Surfboard. Use regular expressions to filter nodes.
>
> \[] The text after the prefix will be treated as a reference to the policy group.

```ini
custom_proxy_group=Group_Name`url-test|fallback|load-balance`Rule_1`Rule_2`...`test_url`interval[,timeout][,tolerance]
custom_proxy_group=Group_Name`select`Rule_1`Rule_2`...
# Format Example
custom_proxy_group=🍎 Apple Service `url-test` (United States | US)` http://www.gstatic.com/generate_204`300,5,100
# This creates a policy group named 🍎 Apple Service `url-test` and adds nodes named "US" to it. It will test the node every 300 seconds, with a speed test timeout of 5 seconds and a node switching delay tolerance of 100ms.
custom_proxy_group=🇯🇵 Japan's lowest latency `url-test` (日|JP) `http://www.gstatic.com/generate_204`300,5
# Creates a url-test policy group called 🇯🇵 Japan's lowest latency, adds nodes named "日" and "JP" to it, and tests every 300 seconds with a 5s timeout.

custom_proxy_group=Load Balancing `load-balance`.*`http://www.gstatic.com/generate_204`300,,100
# Creates a load-balance policy group called Load Balancing, adds all nodes to it, and tests every 300 seconds with a 100ms latency tolerance for node switching.

custom_proxy_group=🇯🇵 JP `select` Shanghai-Japan `Japan` [] 🇯🇵 Japan's lowest latency
# Creates a select group called 🇯🇵 JP policy group, and **sequentially** add nodes named "沪日" and "日本" to it, and reference the previously created 🇯🇵 Japan Lowest Latency policy group.

custom_proxy_group=node_select `select`(^(?!.*(US|Japan)).*)
# Creates a select policy group called "node_select" and **sequentially** adds nodes named "not containing 'US' or '日本').


- Special filtering conditions can also be used:

```
!!GROUPID=%n%`` Nodes included in the n+1th link in the link to be converted

```
!!INSERT=%n%`` Nodes included in the n+1th link in the `insert_url` configuration file

```
!!PROVIDER=%proxy-provider-name%`` Proxy provider with a specified name

GROUPID and INSERT support range matching, such as 1,!2,3-4,!5-6,7+,8- 

```ini 
custom_proxy_group=g1`selec
t`!!GROUPID=0`!!INSERT=0
# Creates a select policy group named g1 and adds all nodes in the first subscription link and the first node in the insert_url configuration file to it.
custom_proxy_group=g2`select`!!GROUPID=1
# Creates a select policy group named g2 and adds all nodes in the second subscription link to it.
custom_proxy_group=g3`select`!!GROUPID=!2
# Creates a select policy group named g3 and adds all nodes in the subscription link except the third subscription link to it.
custom_proxy_group=g4`select`!!GROUPID=3-5
# Creates a select policy group named g4 and adds all nodes in the fourth through sixth subscription links to it.
custom_proxy_group=v2ray`select`!!GROUP=V2RayProvider
# Creates a select provider named v2ray A policy group is created, and all nodes whose group name (tag) is V2RayProvider in the subscription link are added to it.

```

Note: The subscription link here refers to subscriptions in `default_url` and `&url=`, as well as single-link nodes (different from insert_url in the configuration file).

- You can now use a combination of two conditions to filter. Only nodes that meet both conditions will be added to the group.

```ini
custom_proxy_group=g1hk`select`!!GROUPID=0!!(HGC|HKBN|PCCW|HKT|hk|Hong Kong)
# Nodes belonging to the first subscription in the subscription link and whose names contain HGC, HKBN, PCCW, HKT, hk, or Hong Kong
```
- You can also use a JavaScript script to filter nodes for inclusion in a policy group. A "filter" function with one argument, which is an array of all available nodes, should be defined in the script.

```ini
custom_proxy_group=script`select`script:/path/to/script.js
# Creates a select policy group named script, where nodes are filtered using the function in the local script /path/to/script.js.
```

- You can also use a local file.

```ini
custom_proxy_group=!!import:snippets/groups.txt
# Use the local snippets/groups.txt file.
```

</details>

<details>
<summary><b>[aliases]</b></summary>

> Set an alias for the access interface, which can also be used to shorten the URI.

>
> When accessing the alias, all passed parameters are appended to the parameters of the alias target.

Usage instructions are as follows (but not limited to):

- Simplified interface steps (this alias is enabled by default in pref)

```ini
When /clash=/sub?target=clash is set:
Accessing 127.0.0.1/clash?url=xxx will redirect to 127.0.0.1/sub?target=clash&url=xxx
```

- Simplified external configuration paths

```ini
When /mysub=/getprofile?name=aaa&token=bbb is set:
Accessing 127.0.0.1/mysub will redirect to 127.0.0.1/getprofile?name=aaa&token=bbb
```

</details>

<details>
<summary><b>[tasks] section</b></summary>

> This section mainly covers the following: **Scheduled execution of code in a JS file**

1. **task**

> A task that is executed periodically while the server is running.
>
> Usage Task Name\`Cron Expression\`JS File Path\`Timeout (s)

- Example:

```ini
task=tick`0/10 * * * * ?`tick.js`3
```

</details>

<details>
<summary><b>[server] Section</b></summary>

> This section is usually left as default.

1. **listen**

> The address bound to the web server. Setting the address to 0.0.0.0 makes it available to all devices on the LAN.

2. **port**

> The port bound to the web server address. The default is 25500.

3. **serve_file_root**

> The web server's root directory. This can be a folder containing static pages. Leaving it blank disables it.

</details>

<details>
<summary><b>[template] Section</b></summary>

> This section specifies some values ​​within the template.

1. **template_path**

> Specifies the path to the sub-template file (i.e., the template included in the template file using `{% include "xxx.tpl" %}`).

2. **clash.dns, etc.**

> The name can be any non-default parameter for this program, used to determine the value within the template or to use the defined parameter within the template.

</details>

<details>

<summary><b>[advanced] section</b></summary>

> This section is usually left as the default.

1. **log_level**

> Log level. Optional values ​​include: fatal, error, warn, info, debug, and verbose.

2. **print_debug_info**

> Whether to print debug information.

3. **max_pending_connections**

> Maximum number of pending connections.

4. **max_concurrent_threads**

> Maximum number of threads.

5. **max_allowed_rulesets**

> Maximum number of rule sets. 0 means unlimited.

6. **max_allowed_rules**

> Maximum number of rulesets. 0 means unlimited.

7. **max_allowed_download_size**

> Maximum file size when the subconverter downloads external files. If the size exceeds the maximum, the file will be ignored. (Unit: bytes). 0 means unlimited.

8. **enable_cache**

> Whether to enable caching.

9. **cache_subscription**

> Cache duration for subscription files when caching is enabled.

10. **cache_config**

> Cache duration for external configuration files when caching is enabled.

11. **cache_ruleset**

> Cache duration for rule sets when caching is enabled.

12. **script_clean_context**

> Whether scripts use a clean context.

13. **async_fetch_ruleset**

> Parallel download of rule sets.

14. **skip_failed_links**

> Skip failed links and continue the conversion instead of returning an error.

</details>

### External Configuration

> This section is used for the link parameter **`&config=`**

Note: The content in this section is based on [`/config/example_external_config.ini`](https://github.com/metacubex/subconverter/blob/master/base/config/example_external_config.ini) or [`/config/example_external_config.yml`](https://github.com/metacubex/subconverter/blob/master/base/config/example_external_config.yml) or [`/config/example_external_config.toml`](https://github.com/metacubex/subconverter/blob/master/base/config/example_external_config.toml) in this application. This document may not be updated in a timely manner and its content may not be applicable to new versions.

Create a file using the following format and upload it to a Github Gist or other accessible network location.

After processing with [URLEncode](https://www.urlencoder.org/), add it to `&config=` to invoke it.

Note that values ​​defined in the external configuration will override those in the configuration file in the main program directory.

That is, if you define in the external configuration:

```txt
emoji=(traffic|time|emergency),🏳️‍🌈
emoji=Argentina,🇦🇷
```

The program will only match the above two emojis and will not use the country emoji defined in the configuration file in the main program directory.

<details>
<summary><b>Click to view file contents</b></summary>

```ini
[custom]
;This is an example external configuration file.
;All possible custom settings are shown below.

;Options for custom groups will override those in the configuration file in the main program directory.
;Generate Clash using the following pattern Agent group, prefixed with "[]" will be added directly
;Format: Group_Name`select`Rule_1`Rule_2`...
; Group_Name`url-test|fallback|load-balance`Rule_1`Rule_2`...`test_url`interval[,timeout][,tolerance]
;Rule with "[]" prefix will be added directly.

custom_proxy_group=Proxy`select`.*`[]AUTO`[]DIRECT`.*
custom_proxy_group=UrlTest`url-test`.*`http://www.gstatic.com/generate_204`300,5,100
custom_proxy_group=FallBack`fallback`.*`http://www.gstatic.com/generate_204`300,5
custom_proxy_group=LoadBalance`load-balance`.*`http://www.gs tatic.com/generate_204`300,,100
custom_proxy_group=SSID`ssid`default_group`celluar=group0,ssid1=group1,ssid2=group2

;custom_proxy_group=g1`select`!!GROUPID=0
;custom_proxy_group=g2`select`!!GROUPID=1
;custom_proxy_group=v2ray`select`!!GROUP=V2RayProvider

;custom_proxy_group=g1hk`select`!!GR
OUPID=0!!(HGC|HKBN|PCCW|HKT|hk|Hong Kong)
;custom_proxy_group=sstw`select`!!GROUP=V2RayProvider!!(Shenzhen|Changhua|New Taipei|Taiwan|Taiwan)
;custom_proxy_group=provider`select`!!PROVIDER=prov1,prov2,prov3`fallback_nodes

;Options used for custom rules will override the configuration files in the main program directory.
;Ruleset addresses, supports local files/URLs
;Format: Group name,[type:]URL[,interval]
; Group name,[]Rule
;where "type" supports the following values: surge, quanx, clash-domain, clash-ipcidr, clash-classic
;type defaults to surge if omitted
enable_rule_generator=false
overwrite_original_rules=false
;ruleset=DIRECT,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Unbreak.list,86400
;ruleset=🎯 Global direct connection, rules/LocalAreaNetwork.list
;ruleset=DIRECT,surge:rules/LocalAreaNetwork.list
;ruleset=Advertising,quanx:https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Guard/Advertising.list,86400
;ruleset=Domestic Services,clash-domain:https://ruleset.dev/clash_domestic_services_domains,86400
;ruleset=Domestic Services,clash-ipcidr:https://ruleset.dev/clash_domestic_services_ips,86400
;ruleset=DIRECT,clash-classic:https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/China.yaml,86400
;ruleset=🎯 Global Direct Connection,[]GEOIP,CN
;ruleset=🐟 Slipped Through the Net,[]FINAL

;Options used to customize basic configuration will override the configuration files in the main program directory. Contents in
clash_rule_base=base/forcerule.yml
;surge_rule_base=base/surge.conf
;surfboard_rule_base=base/surfboard.conf
;mellow_rule_base=base/mellow.conf
;quan_rule_base=base/quan.conf
;quanx_rule_base=base/quanx.conf

;Options for custom renaming override the configuration files in the main program directory.
;rename=Test-(.*?)-(.*?)-(.*?)\((.*?)\)@\1\4x test line_from\2 to\3
;rename=\(?((x|X)?(\d+)(\.?\d+)?)((\s?multiplier?)|(x|X))\)?@$1x

;Options for custom emoji override the configuration files in the main program directory. Contents in
;add_emoji=true
;remove_old_emoji=true
;emoji=(traffic|time|emergency),🏳️‍🌈
;emoji=Argentina,🇦🇷

;Options for including or excluding node keywords override the contents of the configuration file in the main program directory.
;include_remarks=
;exclude_remarks=

;[template]
;;Variables local to the template
;clash.dns.port=5353
```

</details>

### Template Functionality

> Version 0.5.0 introduced the template functionality, which allows you to retrieve the corresponding template content by setting different conditional parameters.
>
> This allows you to combine multiple template files into one, modify a parameter without changing the template content, and more.

#### Template Calling

Currently, template calling can be used in [External Configuration](#External Configuration) and various base files. For examples, see the reference. [all_base.tpl](./base/base/all_base.tpl)

Common syntax within templates includes the following:

> Various checks can be nested, but ensure logical relationships are correct. For example, if you have an `if` statement, you must have an `endif` statement.
>
> For more usage examples, refer to [INJA Syntax](https://github.com/pantor/inja)

1. Value Retrieval

```inja
{{ global.clash.http_port }}
# Get the value of clash.http_port in the configuration file
```

2. Single Check

```inja
{% if request.clash.dns == "1" %}
···
{% endif %}
# If clash.dns in the URL is 1, the check is true.
```

3. Or Check

```inja
{% if request.target == "clash" or request.target == "clashr" %}
···
{% endif %}
# If the target in the URL is clash or clashr, the check is true.
```

4. If... else...

```inja
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}
# If clash.new_field_name=true in the external configuration, enable the new Clash block name; otherwise, use the old name.
```

5. If exists... then... (this avoids errors when the corresponding parameter is missing in the request)

```inja
{% if exists("request.clash.dns") %}
dns:
enabled: true
listen: 1053
{% endif %}
# If there is a reference to clash.dns in the URL, check if it exists. The check is true if any parameter is specified (can be used with if...else... checks).

```

6. Single check, and use the default value if the parameter is not present (this avoids errors when the corresponding parameter is not present in the request).

```inja
dns:
enabled: true
listen: 1053
nameserver:
{% if default(request.doh, "false") == "true" %}
- https://doh.pub/dns-query
- https://223.5.5.5/dns-query
{% else %}
- 119.29.29.29
- 223.5.5.5
{% endif %}
# Check if the doh parameter in the URL is true.
# If the doh parameter is not present in the URL, set the clash.doh parameter to its default value of false and then check again.
```

Template references fall into the following categories:

1. Retrieved from the configuration file, if the prefix is ​​`global`

```inja
socks-port: {{ global.clash.socks_port }}
# This will be referenced when `clash.socks_port` is set in the configuration file.

```inja
{% if local.clash.new_field_name == "true" %}
···
{% endif %}
# This will take effect when `clash.new_field_name=true` is set in the external configuration, and the content contained therein will be referenced.
```

3. Retrieved from a URL, if the prefix is ​​`request`, for example `http://127.0.0.1:25500/sub?target=clash&url=www.xxx.com&clash.dns=1`

- Validate the URL based on the parameters **included** in the [Advanced Links](#Advanced Links)

```inja
{% if request.target == "clash" %}
···
{% endif %}
# When target=clash, this validation is effective, and the included ··· content is referenced
```

- Validate the URL based on the parameters **not included** in the [Advanced Links](#Advanced Links) (As can be seen from the above link, clash.dns is an additional parameter)

```inja
{% if request.clash.dns == "1" %}
dns:
enabled: true
listen: 1053
{% endif %}
# When clash.dns=1 When the ```` is executed, the judgment takes effect, and the DNS content contained therein is referenced.
```

#### Direct Rendering

When debugging template functions or needing to render a template directly, you can use the following call:

```txt
http://127.0.0.1:25500/render?path=xxx&additional debugging or control parameters
```

Here, ``path` must be within the path specified by ``template_path` in the [Configuration File](#Configuration File)

## Special Usage

### Local Generation

> After starting the program, generate the corresponding configuration file locally.

[generate.ini](https://github.com/metacubex/subconverter/blob/master/base/generate.ini) in the program directory. In the [xxx] section, specify the generated file name (path=xxx) and the parameters it contains. For example:

ini
[test]
path=output.conf
target=surge
ver=4
url=ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpwYXNzd29yZA@www.example.com:1080#Example

[test_profile]
path=output.conf
t.yml
profile=profiles/example_profile.ini
```

Running this program with `subconverter -g` generates configuration files named `output.conf` and `output.yml` in the program's root directory.

Running this program with `subconverter -g --artifact "test"` generates only the `output.conf` configuration file, referenced by the `[test]` file block in the example above, in the program's root directory.

### Automatic Upload

> Automatically upload gists, which can be used for remote subscriptions in apps like Clash for Android and Surge.

Add a `Personal Access Token` ([create this here](https://github.com/settings/tokens/new?scopes=gist&description=Subconverter)) to the [gistconf.ini](https://github.com/metacubex/subconverter/blob/master/base/gistconf.ini) file in the program directory. For example:

```ini
[common]
;Uncomment the following line and enter your token to enable the upload function.

token = xxxxxxxxxxxxxxxxxxxxxxxx (generated Personal Access Token)
```

Adding `&upload=true` to the link generated by [Calling URL](#Calling URL) or [Calling URL (Advanced)](#Calling URL - Advanced)) will automatically upload the gist after the update.
At this point, Subconverter The following prompt message will appear in the program window:

```cmd
No gist id is provided. Creating new gist...
Writing to Gist successful!
Generator: surge4
Path: surge4
Raw URL: https://gist.githubusercontent.com/xxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/raw/surge4
Gist owner: xxxx
```

The `Raw URL: https://gist.githubusercontent.com/xxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/raw/surge4` mentioned above is your online subscription link.

Note that this program sets this link to **secret** by default.

According to the [`Official Manual - Creating Gists`](https://help.github.com/cn/github/writing-on-github/creating-gists):

> Secret gists do not appear in Discover and are not searchable.
>
> Secret gists are not private. If you send the URL to a secret gist to a friend, they can view it.
>
> However, if someone you don't know finds the URL, they can still see your gist.

So be sure to keep the generated `Raw URL` link private.

### Rule Conversion

> Converts a rule to a specified rule type, used to convert different types of rules into each other.

#### Call URL (Rule Conversion)

```txt
http://127.0.0.1:25500/getruleset?type=%TYPE%&url=%URL%&group=%GROUP%
```

#### Call Instructions (Rule Conversion)

| Call Parameters | Required | Example | Explanation |
| ----- | :-------: | :------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| type | Required | 6 | Indicates the type of rule to be generated, represented by a number: 1 for Surge, 2 for Quantumult X, 3 for Clash domain rule-provider, 4 for Clash ipcidr rule-provider, 5 for Surge DOMAIN-SET, and 6 for Clash classical ruleset |
| url | Required | | Refers to the rule link to be converted, which requires Base64 processing. |
| group | Required when type=2 | mygroup | The policy group name corresponding to the rule. Required when generating Quantumult X type (type=2) |

After running the subconverter main program, replace the corresponding content in [Calling Address (Rule Conversion)](#Calling Address-Rule Conversion) to generate the specified type of rule.
