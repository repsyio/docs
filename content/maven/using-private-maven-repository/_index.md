+++
title = "Using Private Maven Repository"
weight = 2
+++

You've created your [repsy](https://repsy.io) account and you have your `default` maven repository. Now, it's time to use it in your java project. Instead of sharing your private repository credentials in your maven project, you may want to create a global maven settings file for your all projects. Let's start with creating that settings file.

## Creating settings.xml file

### Creating settings.xml in Linux and Mac

You can create the `.m2` directory and settings file with the following commands. Please change the *MY REPSY USERNAME* and *MY REPSY PASSWORD* sections in the following snippet.

```bash
mkdir -p ~/.m2/
cat << EOF > ~/.m2/settings.xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
    http://maven.apache.org/xsd/settings-1.0.0.xsd">

    <servers>
        <server>
        <id>repsy</id>
        <username>MY REPSY USERNAME</username>
        <password>MY REPSY PASSWORD</password>
        </server>
    </servers>
</settings>
EOF
```

### Creating settings.xml in Windows

Press `Win + R` key and write `%USERPROFILE%` in the prompt section to go to your home directory. Now you can create a `.m2` folder.

Inside `.m2` folder create a text file and rename it `settings.xml`. Copy the following content and please change the *MY REPSY USERNAME* and *MY REPSY PASSWORD* sections in the text file. You can save and close the document.

## Deploying your Java library into Private Maven Repository

If you consider to deploy your java project. You should define distributon repository in your `pom.xml` file. Please change the *MY REPSY USERNAME* section in the repository URL.

```xml
<project   >
  <!-- ... Other project settings -->

  <distributionManagement>
    <!-- ... Some other Distribution repository definitions -->

    <repository>
      <id>repsy</id>
      <name>My Private Maven Repositoty on Repsy</name>
      <url>https://repo.repsy.io/mvn/MY REPSY USERNAME/default</url>
    </repository>

    <!-- ... Some other Distribution repository definitions -->
  </distributionManagement>

  <!-- ... Other project settings -->
</project>
```

now you're ready to deploy.

```bash
mvn deploy
```

If you don't have maven installed; you can use `./mvwn deploy` in Linux/Mac or `mvnw deploy` in Windows. Most of modern IDEs and editors also provide methodologies for executing maven commands.

You can find a working example in [GitHub](https://github.com/repsyio/example-maven-deploy).

## Using your Java library from your Private Maven Repository

You have deployed you Java library and you want to use it in you project. You want to use it in your another java project. First you need to add a repository section in your `pom.xml` file. Please change the *MY REPSY USERNAME* section in the repository URL.

```xml
<project   >
  <!-- ... Other project settings -->
  <repositories>
    <!-- ... some other repository definitions -->

    <repository>
      <id>repsy</id>
      <name>My Private Maven Repositoty on Repsy</name>
      <url>https://repo.repsy.io/mvn/MY REPSY USERNAME/default</url>
    </repository>

    <!-- ... some other repository definitions -->
  </repositories>
  
  <!-- ... Other project settings -->
</project>
```

And you need to add your dependency in `pom.xml` as well.

```xml
<project   >
  <!-- ... Other project settings -->
  <repositories>
    <!-- ... some other repository definitions -->

    <repository>
      <id>repsy</id>
      <name>My Private Maven Repositoty on Repsy</name>
      <url>https://repo.repsy.io/mvn/MY REPSY USERNAME/default</url>
    </repository>

    <!-- ... some other repository definitions -->
  </repositories>
  
  <!-- ... Other project settings -->
</project>
```

now you're ready to compile the project.

```bash
mvn compile
```

If you don't have maven installed; you can use `./mvwn compile` in Linux/Mac or `mvnw compile` in Windows.

You can find a working example in [GitHub](https://github.com/repsyio/example-maven-usage).

## Furter Reading

You can take a look at Maven Deployment Plug-in offical [documentation](https://maven.apache.org/plugins/maven-deploy-plugin/index.html).