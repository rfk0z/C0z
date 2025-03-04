#!/usr/bin/env ruby
#
# Check for changed posts

Jekyll::Hooks.register :posts, :post_init do |post|
  post_path = post.path

  # Regex  "YYYY-MM-DD-*", with ".md" ext
  valid_filename_pattern = %r{/\d{4}-\d{2}-\d{2}-.+\.md$}

  if post_path && post_path.match?(valid_filename_pattern) && File.exist?(post_path)
    commit_num = `git rev-list --count HEAD "#{post_path}"`.strip.to_i

    if commit_num > 1
      lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{post_path}"`.strip
      post.data['last_modified_at'] = lastmod_date unless lastmod_date.empty?
    end
  end
end
