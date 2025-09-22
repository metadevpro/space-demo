pluginManagement {
    val comSpecificlanguagesMpsVersion: String by settings
    repositories {
        maven("https://artifacts.itemis.cloud/repository/maven-mps/")
        gradlePluginPortal()
    }
    plugins {
        id("com.specificlanguages.mps") version comSpecificlanguagesMpsVersion
    }
}

rootProject.name = "lionweb-space-demo"
