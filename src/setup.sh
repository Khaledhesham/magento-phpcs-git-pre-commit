#!/bin/sh

if [ -e .git/hooks/pre-commit ];
then
    PRE_COMMIT_EXISTS=1
else
    PRE_COMMIT_EXISTS=0
fi

cp ./vendor/smgladkovskiy/phpcs-git-pre-commit/src/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

cwd=$(pwd)
repos=($(ls ./vendor/$1/))
for repo in "${repos[@]}"
do
    cp ./vendor/smgladkovskiy/phpcs-git-pre-commit/src/pre-commit ./vendor/$1/$repo/.git/hooks/pre-commit
    sed -i -e "s~./vendor/bin~$cwd/vendor/bin~g" ./vendor/$1/$repo/.git/hooks/pre-commit
    chmod +x ./vendor/$1/$repo/.git/hooks/pre-commit
done

if [ "$PRE_COMMIT_EXISTS" = 0 ];
then
    echo "Pre-commit git hook is installed!"
else
    echo "Pre-commit git hook is updated!"
fi
