class LegendBookService
  def self.chapters
    Dir.glob(Rails.root.join("app/assets/#{book_directory}/*")).sort_by do |chapter_path|
      chapter_name = File.basename(chapter_path)
      chapter_name.scan(/\d+|\D+/).map { |part| part =~ /\d+/ ? part.to_i : part }
    end.map do |chapter_path|
      chapter_name = File.basename(chapter_path)
      {
        name: chapter_name.gsub("_", " "),
        slug: chapter_name,
        sections: sections_for_chapter(chapter_path)
      }
    end
  end

  def self.sections_for_chapter(chapter_path)
    Dir.glob("#{chapter_path}/*.md").sort.map do |section_path|
      section_name = File.basename(section_path, ".md")
      {
        name: section_name.gsub("_", " "),
        slug: section_name,
        path: section_path
      }
    end
  end

  def self.get_section_content(chapter_slug, section_slug)
    path = Rails.root.join("app/assets/#{book_directory}/#{chapter_slug}/#{section_slug}.md")
    return nil unless File.exist?(path)

    File.read(path)
  end

  def self.book_directory
    "legend_#{I18n.locale}"
  end
end
