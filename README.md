# [Emissary](https://github.com/emissary-ingress/emissary/) container images for Curiefense

This repository publishes [Emissary](https://github.com/emissary-ingress/emissary/) container images with Curiefense.


## Maintenance

Whenever a new Curiefense or Emissary version is released, check the supported versions and add/remove versions in this repository accordingly.

The versioned directories in the repository root are Curiefense versions, the directories one level below are Emissary versions.

If a new Curiefense minor version is released, copy the directory of an earlier version and update the version numbers in it.
Based on the supported Curiefense versions, you may drop old versions from the repository.

Similarly, if there is a new Emissary version, add it to each supported Curiefense version.

Dockerfiles in this repository are not generated and they don't use build args to keep things simple.
We may revisit that decision in the future.


## License

The project is licensed under the [Apache License, Version 2.0](LICENSE).
