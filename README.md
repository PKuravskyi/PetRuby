Acceptance Tests Redesign - Monorepo
=================

<font size="3">
 This is a behavior driven automation framework, written in Ruby with Cucumber Gherkin, that includes API and UI tests.
</font>

Please get acquainted with following documentation before start working with repository
=================

<font size="4">
<b><u>IMPORTANT! MUST READ! </u></b>

* [Code Conventions](https://github.com/Teladoc/acceptance_tests_redesign/wiki/Code-Conventions)
* [Code Review Process](https://github.com/Teladoc/acceptance_tests_redesign/wiki/Code-Review-Process)
* [Release & branching strategy](https://github.com/Teladoc/acceptance_tests_redesign/wiki/Release-&-branching-strategy)
* [Tests writing instruction](https://github.com/Teladoc/acceptance_tests_redesign/wiki/Tests-writing-instruction)

</font>

Table of Contents
=================

* [Overview](#Overview)
* [Ruby version and installation](#Ruby-version-and-installation)
* [Installation Guide for Rubymine](#Installation-Guide-for-Rubymine)
* [Running of tests](#Running-of-tests)
* [Solution for Undefined step reference inspection](#Solution-for-Undefined-step-reference-inspection)
* [Useful links](#Useful-links)
* [QA Machine setup](#Machine-setup)

<a id="Overview"></a>

# Overview

Android project contains next subprojects:

* **Android** [Canada subproject](android/canada)
* **Android** [Danica subproject](android/danica)
* **Android** [Healthiest You subproject](android/healthiest_you)
* **Android** [Teladoc subproject](android/teladoc)
* **Android** [TopDanmark subproject](android/topdanmark)

iOS project contains next subprojects:

* **iOS** [Canada subproject](ios/canada)
* **iOS** [Danica subproject](ios/danica)
* **iOS** [Healthiest You subproject](ios/healthiest_you)
* **iOS** [Teladoc member subproject](ios/teladoc_member)
* **iOS** [Teladoc provider subproject](ios/teladoc_provider)
* **iOS** [TopDanmark subproject](ios/topdanmark)

WEB project contains next subprojects:

* **WEB** [Canada subproject](web/canada)
* **WEB** [Client Operations Portal subproject](web/client_operations_portal)
* **WEB** [Healthiest You subproject](web/healthiest_you)
* **WEB** [Teladoc subproject](web/teladoc)
* **WEB** [UHC subproject](web/uhc)

There are shared directories where services used across all three platforms are stored:

* Repo constants are stored in [Constants](constants) directory
* Generators implementation is placed in [Generators](generators) directory
* API endpoints calls implementation is placed in [Service](service) directory
* Base layer asserts are placed in [Asserts](asserts) directory
* Utils are placed in [Utils](utils) directory
* Images, files and docs for testing (fixtures) are stored in [lfsfiles](lfsfiles) directory

<a id="Ruby-version-and-installation"></a>

# Ruby version and installation

Ruby version we are using:

```ruby
ruby '3.2.1'
```

For managing ruby versions we recommend these materials:

* [Installing Ruby documentation](https://www.ruby-lang.org/en/documentation/installation/)
* [ASDF](https://asdf-vm.com/#/) ([Installation guide](https://asdf-vm.com/guide/getting-started.html))
* [(Optional)Install Ruby for macOS Terminal](https://mac.install.guide/ruby/5.html)

To update/install your ruby version to 3.2.1 use this commands in terminal:

To update your ruby version

```shell
asdf plugin-update ruby
```

To install new version of ruby

```shell
asdf install ruby 3.2.1 
```

To make global version of ruby

```shell
asdf global ruby 3.2.1
```

**If you have some issue with installation(openssl error) try this command:**

```shell
OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration asdf install ruby 3.2.1
```

**If you can't change Ruby version in your framework - try this command and restart your program(example: Ruby Mine) again:**

```shell
rm ~/.asdf/shims/*
asdf reshim
```

Also you can update/install Ruby using RVM(Ruby version manager) (details [Ruby installation](https://www.ruby-lang.org/en/documentation/installation/)) or by using this commands:

<a id="Installation-Guide-for-Rubymine"></a>

# Installation Guide for Rubymine

1. Clone the repository
2. Open repository in IDE
3. Wait for indexing by IDE
   ![indexing](lfsfiles/wiki/indexing.png)
4. Click `Configure...` for Gemfile found in the project IDE
   ![gemfile_configure](lfsfiles/wiki/gemfile_configure.png)
5. Create projects for all gem files by clicking the `OK` button        
   ![gemfiles](lfsfiles/wiki/gemfiles.png)
6. Go to IDE preferences and put for every `Ruby SDK and Gems` - **asdf 3.2.1** (if you have another version of ruby installed)
   ![preference](lfsfiles/wiki/preference.png)
7. To proceed with project installation find it in README files for each subproject [Overview](#Overview)

Also if you want to install **bundle** for all platforms, and you are using Ruby Mine, you can
open [bundle.sh](bundle.sh) script and just run it by clicking on green triangle.

If you are using other IDE, you can run it via terminal

```shell
sh bundle.sh
```

# Running of tests

<a id="Running-of-tests"></a>

**To run the tests please read information in respective platform README.md file.**

* **Android platform** [README](android/README.md)
* **iOS platform** [README](ios/README.md)
* **WEB platform** [README](web/README.md)

# Solution for Undefined step reference inspection

<a id="Solution-for-Undefined-step-reference-inspection"></a>

**For resolving issue with "Undefined step reference" inspection you can use symlinks for generators/core/step_definitions**

**Commands for creating symlinks for each platform**

* **Android platform**
```shell
ln -s /<path/to/project>/acceptance_tests_redesign/generators/core/step_definitions /<path/to/project>/acceptance_tests_redesign/android/core/features/step_definitions
```
* **iOS platform**
```shell
ln -s /<path/to/project>/acceptance_tests_redesign/generators/core/step_definitions /<path/to/project>/acceptance_tests_redesign/ios/core/features/step_definitions
```
* **WEB platform**
```shell
ln -s /<path/to/project>/acceptance_tests_redesign/generators/core/step_definitions /<path/to/project>/acceptance_tests_redesign/web/core/features/step_definitions
```

# Useful links

<a id="Useful-links"></a>

All useful documentation for this project can be found in our **Wiki**

* [Wiki Pages link](https://github.com/Teladoc/acceptance_tests_redesign/wiki)
* [Mobile tools to work with framework](https://github.com/Teladoc/acceptance_tests_redesign/wiki/Mobile-tools-to-work-with-framework)

<a id="Machine-setup"></a>
Information about how to setup local machine for tests can be found on confluence
here [QA Machine Setup](https://confluence.teladoc.net/display/TDOC/QA+Machine+Setup). We recommend all new employees
start here to fully setup your new machine.
