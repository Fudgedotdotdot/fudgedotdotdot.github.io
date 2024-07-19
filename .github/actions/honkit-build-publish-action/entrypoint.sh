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


echo '[INFO] Some magic to merge main into gh-pages...'
git fetch origin gh-pages --depth 1
git checkout gh-pages
git rebase main

cp -R _book/* .s
git clean -fx node_modules
git clean -fx _book
git add .

git config --local user.name "Fudgedotdotdot"
git config --local user.email "28399056+Fudgedotdotdot@users.noreply.github.com"

git commit -am "Update docs"
git push origin HEAD:gh-pages --force
git checkout main
