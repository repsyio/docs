+++
title = "Using Public Maven Repository"
weight = 3
+++

For some cases, You may want to publish some of your artifacts publicly visible. [Repsy](https://repsy.io) does not support anonymous deployment for security reasons but clients can download artifact without passwords.

## Creating settings.xml file

You may take a look at private maven repository [usage documentation](../using-private-maven-repository#creating-settingsxml-file) for detailed instructions.


## Deploying your Java library into Public Maven Repository

You may take a look at private maven repository [usage documentation](../using-private-maven-repository#deploying-your-java-library-into-private-maven-repository) for detailed instructions.

## Using your Java library from your Public Maven Repository

For deployment and usage part it's same as private maven usage. But if your clients only want to use libraries no need for `settings.xml` configuration they can just define URL and dependency in `pom.xml` file. Please take a look at [usage documentation](../using-private-maven-repository#using-your-java-library-from-your-private-maven-repository).
