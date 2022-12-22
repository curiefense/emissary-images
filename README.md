# [Emissary](https://github.com/emissary-ingress/emissary/) container images for Curiefense

This repository publishes [Emissary](https://github.com/emissary-ingress/emissary/) container images with Curiefense.

## Usage

Pick an Emissary and a Curiefense version (either full semver or a shortened major-minor version).
Image tags are constructed according to the following pattern:

```
ghcr.io/curiefense/emissary:VERSION-curiefenseVERSION
```

To ensure that subsequent builds don't break your production environment,
you may want to pin your image to a specific build:

```
ghcr.io/curiefense/emissary:VERSION-curiefenseVERSION-build.BUILD_NUMBER
```

While the tag in the first example is a moving tag (subsequent builds of the same versions produce the same tags),
build number annotated tags are immutable.

Install Emissary using your usual method, but use one of the above images.

TODO: add more docs about installing Emisary.


## Maintenance

Whenever a new Curiefense or Emissary version is released, check the supported versions and add/remove versions in this repository accordingly.

The versioned directories in the repository root are Curiefense versions, the directories one level below are Emissary versions.

If a new Curiefense minor version is released, copy the directory of an earlier version and update the version numbers in it.
Based on the supported Curiefense versions, you may drop old versions from the repository.

Similarly, if there is a new Emissary version, add it to each supported Curiefense version.

When adding and deleting versions from this repository, don't forget to update the build matrix in [.github/workflows/artifacts.yaml](.github/workflows/artifacts.yaml).

Dockerfiles in this repository are not generated and they don't use build args to keep things simple.
We may revisit that decision in the future.

Patch versions are automatically updated by Dependabot.


## License

The project is licensed under the [Apache License, Version 2.0](LICENSE).
