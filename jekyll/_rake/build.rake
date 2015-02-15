desc 'build jekyll'
task :build do
  # clean _site folder
  `rm -rf ./_site`

  # build updated site to its folder
  `jekyll b -t -d ./_site`

  # to folder of master branch
  `cd ../`

  # switch to master branch
  `git checkout master`

  # remove published files
  `rm -f ./feed.xml`
  `rm -f ./index.html`

  # remove published folders
  `rm -rf ./2014`
  `rm -rf ./2015`
  `rm -rf ./about`
  `rm -rf ./assets`
  `rm -rf ./css`
  `rm -rf ./cv`
  `rm -rf ./projects`
  `rm -rf ./readings`

  `pwd`
  `ls`

  # copy updated site to master folder
  `cp -r ./jekyll/_site/* ./`
end
