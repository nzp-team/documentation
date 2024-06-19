# Nazi Zombies: Portable Documentation

## About
This repository contains the "source code" for the [Nazi Zombies: Portable Documentation](https://docs.nzp.gay) page, hosted by Neocities.

The type of content, as described on the page itself, is geared towards Map Makers, Content Modders, etc. It is designed to be for "power users", more than general users.

## Building
[Pandoc](https://pandoc.org/) is a required dependency for building the Markdown source into HTML. Once installed, just run `generate_docs.sh`. HTML source will be generated in the newly created `build/` directory.

## Contributing
Contributions are welcome, provided they follow the existing pattern of material style and fit the general content type. It is important to consider that these documents are intended to be information first, and images only as supplemental content. `WebP` format images are used, with low quality settings and low base resolutions to keep these docs dense in information but small in disk footprint.

## Licensing
The content contained on the documentation page is licensed under [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), whereas the HTML template is GPLv3, as it is derived from the [TrenchBroom Manual](https://trenchbroom.github.io/manual/latest/).