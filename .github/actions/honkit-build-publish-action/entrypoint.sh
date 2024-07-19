<<<<<<< HEAD
=======
# Inspired by https://github.com/onejar99/gitbook-build-publish-action

# function checkIfErr() {
#     ret=$?
#     echo "ret=[${ret}]"
#     if [ ! $ret = '0' ]; then
#         echo "Oops something wrong! exit code: ${ret}"
#         exit $ret;
#     fi
# }

>>>>>>> f02eb51 (Update docs)
echo '[INFO] Building static website...'
cd ${GITHUB_WORKSPACE}
git config --global --add safe.directory /github/workspace

honkit build

<<<<<<< HEAD
=======

>>>>>>> f02eb51 (Update docs)
echo '[INFO] Some magic to merge main into gh-pages...'
git fetch origin gh-pages --depth 1
git checkout gh-pages
git rebase main

<<<<<<< HEAD
cp -R _book/* .
=======
cp -R _book/* .s
>>>>>>> f02eb51 (Update docs)
git clean -fx node_modules
git clean -fx _book
git add .

git config --local user.name "Fudgedotdotdot"
git config --local user.email "28399056+Fudgedotdotdot@users.noreply.github.com"

<<<<<<< HEAD
echo '[INFO] Pushing gh-pages...'
git commit -am "Updated with:  $(echo $GITHUB_SHA | cut -c1-7))"
git push origin HEAD:gh-pages --force
git checkout main
=======
git commit -am "Update docs"
git push origin HEAD:gh-pages --force
git checkout main
>>>>>>> f02eb51 (Update docs)
