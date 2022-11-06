# Magento PHPCS git pre-commit hook

## About

This is a fork of the original package to support Magento standard and development way of vendor modules. Auto installed git pre-commit hook for running [PHP Code Sniffer](https://github.com/squizlabs/PHP_CodeSniffer) 
code checking to PSR2 coding standard compliance. It checks only files that are to be committed.

Inspired by [Enforce code standards with composer, git hooks, and phpcs](http://tech.zumba.com/2014/04/14/control-code-quality/)

## Installation

Include a dependency for `smgladkovskiy/phpcs-git-pre-commit` in your composer.json file manually, with specifying the fork in the respositories:

    {
        "require-dev": {
            "smgladkovskiy/phpcs-git-pre-commit": "dev-master"
        }
        "repositories": [
            {
                "type": "vcs",
                "url": "https://github.com/Khaledhesham/magento-phpcs-git-pre-commit"
            }
        ],
    }

To enable code sniff, аdd to `post-install-cmd` and `post-update-cmd` in `composer.json` installation script:

    "scripts": {
        "install-hooks": ["[ ! -f ./vendor/smgladkovskiy/phpcs-git-pre-commit/src/setup.sh ] || sh ./vendor/smgladkovskiy/phpcs-git-pre-commit/src/setup.sh <YOUR_VENDOR_NAME>"],
        "post-install-cmd": ["@install-hooks"],
        "post-update-cmd": ["@install-hooks"]
    }

Then run `composer install` or `composer update`. `pre-commit` hook will be installed or updated if it already exists.

## Usage

Run `git commit` and pre-commit hook will check your committed files like if you run

    php phpcs.phar --standard=Magento2 --encoding=utf-8 -n -p /path/to/file.php

## Contributing

Feel free to make pull requests!
