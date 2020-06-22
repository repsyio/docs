+++
title = "Using Repository with Gradle"
weight = 4
+++

If you are using [Gradle](https://gradle.org/) as a dependency management tool. You can use [Repsy](https://repsy.io) for both deployment and download operations as well.

## Deployment

If you're intended to use a [Repsy](https://repsy.io) Maven repository as deployment environment. In both private and public repository cases, you need to use repository credentials for package deployment. By default, [gradle publish plug-in](https://docs.gradle.org/current/userguide/publishing_maven.html) enforce you to use credentials inside `build.gradle`. 

### Configuring build.gradle

You need to add publishing section in your `build.gradle` file.

```groovy
publishing {
    publications {
        maven(MavenPublication) {
            from components.java
        }
    }

    repositories {
        maven {
            url 'https://repo.repsy.io/mvn/{MY REPSY USERNAME}/{MY REPOSITORY NAME}'
            credentials {
                username 'MY REPSY USERNAME'
                password 'MY REPSY PASSWORD'
            }
        }
    }
}
```

Please modify URL, username and password sections regarding your repository settings. Alternatively you may consider to put your variables into `gradle.properties` in your home directory.

For Windows:

Press `Win + R` key and write `%USERPROFILE%` in the prompt section to go to your home directory. Inside the `.gradle` folder, you can find `gradle.properties`.

For Linux/Mac:

Please open the file `~/.gradle/gradle.properties` location.

If there's no properties file, you may create one and please add following variables into your `gradle.properies` file.


```properties
repsyUrl=https://repo.repsy.io/mvn/{MY REPSY USERNAME}/{MY REPOSITORY NAME}
repsyUsername=MY REPSY USERNAME
repsyPassword=MY REPSY PASSWORD
```

and finally you can change your `build.gradle` file.

```groovy
publishing {
    publications {
        maven(MavenPublication) {
            from components.java
        }
    }

    repositories {
        maven {
            url repsyUrl
            credentials {
                username repsyUsername
                password repsyPassword
            }
        }
    }
}
```

After configuration completed you can run the following command. If gradle is installed globally:

```bash
gradle publish
```

If gradle wrapper is in your project directory:

Windows:

```
gradlew publish
```

Linux/Mac:

```
./gradlew publish
```

You can find a working example in [GitHub](https://github.com/repsyio/example-gradle-deploy).

## Usage

If you're using a private maven repository and already configured your `gradle.properties` file; Please add
the following section into your `build.gradle` file

```groovy
repositories {
    mavenCentral()

    maven {
        url repsyUrl
        credentials {
            username repsyUsername
            password repsyPassword
        }
    }
}
```

If you're using a public repository you may ignore the credentials section.

```groovy
repositories {
    mavenCentral()

    maven {
        url repsyUrl
    }
}
```

Now you can build your project.

```bash
./gradlew build
```

You can find a working example in [GitHub](https://github.com/repsyio/example-gradle-usage).