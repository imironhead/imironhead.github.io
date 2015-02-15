desc 'build jekyll'
task :build do
  # remove published files
  `rm ../feed.xml`
  `rm ../index.html`

  # remove published folders
  `rm -rf ../2014`
  `rm -rf ../2015`
  `rm -rf ../about`
  `rm -rf ../assets`
  `rm -rf ../css`
  `rm -rf ../cv`
  `rm -rf ../projects`
  `rm -rf ../readings`

  # remove built files and folders
  `rm -rf _site`

  # build and copy to public path
  `jekyll b -t -d ./_site`
  `cp -r ./_site/* ../`
end
