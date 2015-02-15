module Note
  # Source contents:
  #   ./_notes/topic/notes.md
  # Target
  #   all markdowns under ./_notes/*/*.md will be transfered to
  #   ./notes/*/*.html, and a ./notes/index.html to list all notes.
  # There can be more than 1 source folder (e.g. ./_notes/)
  class NotesGenerator < Jekyll::Generator
    def generate(site)
      targets(site).each do | target |
        list = []

        enum_topics(target).each do | topic |
          pages = generate_topic_pages(site, target, topic)

          list << pages

          site.pages |= pages['notes']
        end

        site.pages << NotesListPage.new(site, target, "/#{target}", list)
      end
    end

    def targets(site)
      config = site.config['notes']

      if config.is_a? String
        [config]
      elsif config.is_a? Array
        config
      else
        ['notes']
      end
    end

    def generate_topic_pages(site, target, topic)
      source_dir = "/_#{target}/#{topic}/"
      target_dir = "/#{target}/#{topic}/"

      pages = enum_notes(target, topic)
              .map { |x| NotePage.new(site, source_dir, target_dir, x) }

      { 'title' => topic.gsub('-', ' ').capitalize, 'notes' => pages }
    end

    def enum_topics(target)
      Dir["./_#{target}/*"]
        .select { |x| File.directory? x }
        .map { |x| File.basename x }
    end

    def enum_notes(target, topic)
      Dir["./_#{target}/#{topic}/*"]
        .select { |x| File.file? x }
        .map { |x| File.basename x }
    end
  end

  # temp
  class NotePage < Jekyll::Page
    def initialize(site, source_dir, target_dir, name)
      @site = site
      @base = site.source
      @dir = ''
      @name = name

      @url = File.join(target_dir, File.basename(name, '.md') + '.html')

      process(name)

      read_yaml(File.join(@base, source_dir), name)

      data['is_note'] = true
    end
  end

  # temp
  class NotesListPage < Jekyll::Page
    def initialize(site, title, dir, topics)
      @site = site
      @base = site.source
      @dir = dir
      @name = 'index.html'

      @url = "#{dir}/index.html"

      process('')

      self.data = { 'layout' => 'notes-list', 'title' => title.capitalize,
                    'is_note' => true, 'topics' => topics }
    end
  end
end
