# Inspired by https://github.com/onejar99/gitbook-build-publish-action

# function checkIfErr() {
#     ret=$?
#     echo "ret=[${ret}]"
#     if [ ! $ret = '0' ]; then
#         echo "Oops something wrong! exit code: ${ret}"
#         exit $ret;
#     fi
# }

echo '[INFO] Building static website...'
cd ${GITHUB_WORKSPACE}
git config --global --add safe.directory /github/workspace

honkit build
ls -alt _book/

git branch
git remote -v
echo $(git config -l)

git fetch origin gh-pages --depth 1
git checkout gh-pages
git rebase main

# now gh-pages and main are the same, prepare the correct directory structure for github pages
cp -R _book/* .

git clean -fx node_modules
git clean -fx _book
git add .


git config --local user.name "Fudgedotdotdot"
git config --local user.email "28399056+Fudgedotdotdot@users.noreply.github.com"

git commit -m "Update docs"
git push -u origin gh-pages

git checkout main

# # checkout to the gh-pages branch
# git checkout gh-pages

# # pull the latest updates
# git pull origin gh-pages --rebase

# # copy the static site files into the current directory.
# cp -R _book/* .

# # remove 'node_modules' and '_book' directory
# git clean -fx node_modules
# git clean -fx _book

# # add all files
# git add .

# git log


# commit
#git commit -a -m "Update docs"

# push to the origin
#git push origin gh-pages

# checkout to the master branch
#git checkout master